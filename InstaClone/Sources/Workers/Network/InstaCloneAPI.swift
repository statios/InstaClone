//
//  InstaClonAPI.swift
//  InstaClone
//
//  Created by KIHYUN SO on 2020/12/24.
//

import Foundation
import Moya

enum InstaCloneAPI {
  case home
}

extension InstaCloneAPI: TargetType {
  var baseURL: URL {
    return URL(string: "http://instaclone-api.com")! //fake
  }
  
  var path: String {
    switch self {
    case .home: return "/home"
    }
  }
  
  var method: Moya.Method {
    switch self {
    case .home: return .get
    }
  }
  
  var sampleData: Data {
    switch self {
    case .home: return Data()
    }
  }
  
  var task: Task {
    switch self {
    case .home: return .requestPlain
    }
  }
  
  var headers: [String: String]? {
    return [:]
  }
}
