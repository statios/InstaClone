//
//  NetworkWorker.swift
//  InstaClone
//
//  Created by KIHYUN SO on 2020/12/24.
//

import Foundation
import Moya
import RxSwift

protocol NetworkWorkerLogic {
  var provider: NetworkProvider<InstaCloneAPI> { get }
  func request<T: Codable>(
    to router: InstaCloneAPI,
    type: T.Type
  ) -> Single<T>
}

extension NetworkWorkerLogic {
  func request<T: Codable>(
    to router: InstaCloneAPI,
    type: T.Type
  ) -> Single<T> {
    return provider.rx.request(router)
      .map(T.self)
  }
}

final class NetworkWorker: BaseWorker {
  let provider = NetworkProvider<InstaCloneAPI>()
}

extension NetworkWorker: NetworkWorkerLogic { }

final class StubNetworkWorker: BaseWorker {
  let provider = NetworkProvider<InstaCloneAPI>(
    stubClosure: MoyaProvider.immediatelyStub
  )
}

extension StubNetworkWorker: NetworkWorkerLogic { }
