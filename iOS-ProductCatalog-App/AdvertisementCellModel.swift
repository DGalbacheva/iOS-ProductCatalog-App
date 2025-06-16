//
//  AdvertisementCellModel.swift
//  iOS-ProductCatalog-App
//
//  Created by Doroteya Galbacheva on 16.06.2025.
//

import Foundation

struct AdvertisementCellModel {
    let imageUrl: URL?
    let title: String
    let price: String
    let location: String
    let date: String
    
    init(from advertisementModel: AdvertisementModel) {
        imageUrl = URL(string: advertisementModel.imageUrl ?? "")
        title = advertisementModel.title ?? ""
        price = advertisementModel.price ?? ""
        location = advertisementModel.location ?? ""
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        if let newDate = formatter.date(from: advertisementModel.createdDate ?? "") {
            formatter.dateStyle = .medium
            formatter.locale = .current
            date = formatter.string(from: newDate)
        } else {
            date = ""
        }
    }
}
