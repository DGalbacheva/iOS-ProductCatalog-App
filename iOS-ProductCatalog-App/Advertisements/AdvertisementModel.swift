//
//  AdvertisementModel.swift
//  iOS-ProductCatalog-App
//
//  Created by Doroteya Galbacheva on 16.06.2025.
//

import Foundation

struct AdvertisementModel: Decodable {
    let id: String?
    let title: String?
    let price: String?
    let location: String?
    let imageUrl: String?
    let createdDate: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case title = "title"
        case price = "price"
        case location = "location"
        case imageUrl = "imageUrl"
        case createdDate = "createdDate"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(String.self, forKey: .id)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        price = try values.decodeIfPresent(String.self, forKey: .price)
        location = try values.decodeIfPresent(String.self, forKey: .location)
        imageUrl = try values.decodeIfPresent(String.self, forKey: .imageUrl)
        createdDate = try values.decodeIfPresent(String.self, forKey: .createdDate)
    }
}

struct AdvertisementsModel: Decodable {
    let advertisements: [AdvertisementModel]
}
