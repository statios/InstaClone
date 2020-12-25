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
  associatedtype API: TargetType
  var provider: NetworkProvider<API> { get }
  func request<T: Codable>(
    to router: API,
    type: T.Type
  ) -> Single<T>
}

final class NetworkWorker: BaseWorker {
  var provider: NetworkProvider<API>
}

extension NetworkWorker: NetworkWorkerLogic {
  
}
