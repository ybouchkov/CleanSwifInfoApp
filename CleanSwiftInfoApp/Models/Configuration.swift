//
//  Configuration.swift
//  CleanSwiftInfoApp
//
//  Created by Yani Buchkov on 18.12.18.
//  Copyright © 2018 Yani Buchkov. All rights reserved.
//

import Foundation
import UIKit

enum Enviroment: String {
    case staging
    case production
    case release
    
    var baseURL: String {
        switch self {
        case .staging:
            return "" // url for staging
        case .production:
            return "" // url for the production
        case .release:
            return "" // url for the release
        }
    }
    
    var token: String {
        switch self {
        case .staging:
            return "token=%staging-1234"
        case .production:
            return "token=%production-1234"
        case .release:
            return "token=%release-1234"
        }
    }
}

struct Configuration {
    
    lazy var enviroment: Enviroment = {
        if let configuration = Bundle.main.object(forInfoDictionaryKey: "Configuration") as? String {
            if configuration.range(of: "Staging") != nil {
                return Enviroment.staging
            } else if configuration.range(of: "Production") != nil {
                return Enviroment.production
            }
        }
        
        return Enviroment.release
    }()
}
