//
//  AdvertisementsViewModel.swift
//  iOS-ProductCatalog-App
//
//  Created by Doroteya Galbacheva on 16.06.2025.
//

import Foundation
import Combine

class AdvertisementsViewModel {
    
    enum LoadingState {
        case idle
        case loading
        case failed
        case loaded
    }
    
    @Published var state: LoadingState = .idle
    public var advertisementsData: [AdvertisementCellModel] = []
    private var storage: Set<AnyCancellable> = []
    
    public func fetchData() {
        state = .loading
        
        URLSession.shared.dataTaskPublisher(for: URL(string: "https://www.avito.st/s/interns-ios/main-page.json")!)
            .map { $0.data }
            .decode(type: AdvertisementsModel.self, decoder: JSONDecoder())
            .replaceError(with: AdvertisementsModel(advertisements: []))
            .map { $0.advertisements }
            .tryMap { model -> [AdvertisementCellModel] in
                model.map {
                    AdvertisementCellModel(from: $0)
                }
            }
            .replaceError(with: [])
            .sink { [weak self] model in
                self?.advertisementsData = model
                self?.state = .loaded
            }
            .store(in: &storage)
        
    }
}
