//
//  NetworkProvider.swift
//  InstaClone
//
//  Created by KIHYUN SO on 2020/12/25.
//

import Moya
import RxSwift
import Alamofire
import Foundation

final class NetworkProvider<Target: TargetType>: MoyaProvider<Target> {

  override init(endpointClosure: @escaping MoyaProvider<Target>.EndpointClosure = MoyaProvider.defaultEndpointMapping,
                requestClosure: @escaping MoyaProvider<Target>.RequestClosure = MoyaProvider<Target>.defaultRequestMapping,
                stubClosure: @escaping MoyaProvider<Target>.StubClosure = MoyaProvider.neverStub,
                callbackQueue: DispatchQueue? = nil,
                session: Session = MoyaProvider<Target>.defaultAlamofireSession(),
                plugins: [PluginType] = [],
                trackInflights: Bool = false) {
    super.init(endpointClosure: endpointClosure,
               requestClosure: requestClosure,
               stubClosure: stubClosure,
               callbackQueue: callbackQueue,
               session: session,
               plugins: [NetworkLoggerPlugin()],
               trackInflights: trackInflights
    )
  }
}
