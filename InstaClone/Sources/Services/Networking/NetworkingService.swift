//
//  NetworkWorker.swift
//  InstaClone
//
//  Created by KIHYUN SO on 2020/12/24.
//

import Foundation
import Moya
import RxSwift

protocol NetworkingServiceType {
  var provider: NetworkProvider<InstaCloneAPI> { get }
}

extension NetworkingServiceType {
  func request<T: Codable>(
    to router: InstaCloneAPI,
    type: T.Type,
    completion: @escaping (T?, Error?) -> Void
  ) {
    provider.request(router) { result in
      switch result {
      case let .success(response):
        do {
          let decoded = try JSONDecoder().decode(type, from: response.data)
          completion(decoded, nil)
        } catch let error {
          completion(nil, error)
        }
      case let .failure(error):
        completion(nil, error)
      }
    }
  }
}

final class NetworkingService: NetworkingServiceType {
  let provider = NetworkProvider<InstaCloneAPI>(
    stubClosure: MoyaProvider.immediatelyStub
  )
}
