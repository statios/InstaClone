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
    case .home: return getSampleData(name: "HomeSample")
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

// Helpers
extension InstaCloneAPI {
  private func getSampleData(name: String?) -> Data {
    guard let path = Bundle.main.path(forResource: name, ofType: "json") else { return Data() }
    let url = URL(fileURLWithPath: path)
    guard let data = try? Data(contentsOf: url) else { return Data() }
    return data
  }
}
