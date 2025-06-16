//
//  AdvertisementsViewModel.swift
//  iOS-ProductCatalog-App
//
//  Created by Doroteya Galbacheva on 16.06.2025.
//

import Foundation
import Combine

class AdvertisementsViewModel {
    @Published var state: States.LoadingStates = .idle
    public var advertisementsData: [AdvertisementCellModel] = []
    private var storage: Set<AnyCancellable> = []
    
    public func fetchData() {
        state = .loading
        
        guard let url = URL(string: Constants.stringURLs.getMainPageURL()) else {
            state = .failed
            return
        }
        
        URLSession.shared.dataTaskPublisher(for: url)
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
            .receive(on: DispatchQueue.main)
            .sink { [weak self] model in
                self?.advertisementsData = model
                self?.state = .loaded
            }
            .store(in: &storage)
        
    }
}
