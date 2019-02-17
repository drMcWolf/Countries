//
//  ApiUrl.swift
//  Countries
//
//  Created by Макаров Иван on 17/02/2019.
//  Copyright © 2019 123. All rights reserved.
//

import Foundation
import Moya

enum ApiUrl {
    case all
    case name(name: String)
}

extension ApiUrl: TargetType {
    var baseURL: URL {
        return URL(string: "https://restcountries.eu/rest/v2")!
    }
    
    var path: String {
        switch self {
            case .all:
                return "/all"
            case .name(let name):
                return "/name/\(name)"
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        return .requestPlain
    }
    
    var headers: [String : String]? {
        return nil
    }
    
    
}
