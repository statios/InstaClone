//
//  NetworkingWorker.swift
//  InstaClone
//
//  Created by KIHYUN SO on 2020/12/26.
//

import Foundation
import Moya

protocol NetworkingWorkerLogic {
  var provider: NetworkProvider<InstaCloneAPI> { get }
  func request<T: Codable>(
    to router: InstaCloneAPI,
    type: T.Type,
    completion: @escaping (T?, Error?) -> Void
  )
}

extension NetworkingWorkerLogic {
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

final class NetworkingWorker: BaseWorker, NetworkingWorkerLogic {
  let provider = NetworkProvider<InstaCloneAPI>(
    stubClosure: MoyaProvider.immediatelyStub
  )
}
