//
//  APIRouter.swift
//  CleanSwiftInfoApp
//
//  Created by Yani Buchkov on 19.12.18.
//  Copyright © 2018 Yani Buchkov. All rights reserved.
//

import Foundation
import Alamofire

enum APIRouter: URLRequestConvertible {
    
    // MARK: - URL
    
    static let baseURL = Enviroment.shared.configuration(.serverURL)
    
    // MARK: - API Requests
    
    case persons
    
    // MARK: - Paths
    
    var path: String {
        switch self {
        case .persons:
            return "persons"
        }
    }
    
    // MARK: - Method
    
    var method: HTTPMethod {
        switch self {
        default:
            return .get
        }
    }
    
    // MARK: - Parameters
    
    var params: Parameters? {
        switch self {
        case .persons:
            return nil
        }
    }
    
    // MARK: - Encoding
    
    var encoding: ParameterEncoding {
        switch method {
        case .get:
            return URLEncoding.default
        default:
            return JSONEncoding.default
        }
    }

    // MARK: - URLRequestConvertible

    func asURLRequest() throws -> URLRequest {
        let url = URL(string: "asdad")
        return URLRequest(url: url!)
    }
}
