//
//  Constants.swift
//  iOS-ProductCatalog-App
//
//  Created by Doroteya Galbacheva on 16.06.2025.
//

import Foundation

enum Constants {
    
    private enum stringURLsParts {
        static var basicURL: String {
            "https://www.avito.st/s/interns-ios/"
        }
        static var mainPage: String {
            "main-page"
        }
        static var details: String {
            "details/"
        }
        static var jsonExtension: String {
            ".json"
        }
    }
    
    enum stringURLs {
        static func getMainPageURL() -> String {
            return stringURLsParts.basicURL + stringURLsParts.mainPage + stringURLsParts.jsonExtension
        }
        static func getDetailsURL(id: String) -> String {
            return stringURLsParts.basicURL + stringURLsParts.details + id + stringURLsParts.jsonExtension
        }
    }
}
