//
//  Configuration.swift
//  CleanSwiftInfoApp
//
//  Created by Yani Buchkov on 18.12.18.
//  Copyright © 2018 Yani Buchkov. All rights reserved.
//

import Foundation
import UIKit

enum PlistError: Error {
    
    case invalidEnvironmentConfiguration(key: PlistKey)
    
}

enum PlistKey {
    
    case serverURL
    case timeoutInterval
    case connectionProtocol
    
    var value: String {
        switch self {
        case .serverURL:
            return "server_url"
        case .timeoutInterval:
            return "timeout_interval"
        case .connectionProtocol:
            return "protocol"
        }
    }
    
//    func value1() -> String {
//        switch self {
//        case .serverURL:
//            return "server_url"
//        case .timeoutInterval:
//            return "timeout_interval"
//        case .connectionProtocol:
//            return "protocol"
//        }
//    }
}

final class Enviroment {
    
    // MARK: - Singleton
    static var shared = Enviroment()
    
    // MARK: - Init
    private init() {}
    
    fileprivate var infoDict: [String: Any] {
        if let dict = Bundle.main.infoDictionary {
            return dict
        } else {
            fatalError("Plist connot be found")
        }
    }
    
    func configuration(_ key: PlistKey) -> String {
        switch key {
        case .serverURL:
            guard let dict = infoDict[PlistKey.serverURL.value] as? String else { fatalError("Cannot find Server_URL!!!") }
            return dict
        case .timeoutInterval:
            guard let dict = infoDict[PlistKey.timeoutInterval.value] as? String else { fatalError("Time_Interval is missing!!!") }
            return dict
        case .connectionProtocol:
            guard let dict = infoDict[PlistKey.connectionProtocol.value] as? String else { fatalError("Protocol is missing!!!") }
            return dict
        }
    }
}
