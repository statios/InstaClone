//
//  AppResolver.swift
//  InstaClone
//
//  Created by Stat on 2020/12/23.
//

import Foundation
import Resolver

final class AppResolver: ResolverRegistering {
  static func registerAllServices() {
    registerHomeScene()
  }
}

extension AppResolver {
  static func registerHomeScene() {
    Resolver.register { HomeRouter() }
      .implements((HomeRoutingLogic & HomeDataPassing).self)
    Resolver.register { HomeInteractor() }
      .implements(HomeBusinessLogic.self)
      .scope(Resolver.shared)
    Resolver.register { HomeInteractor() }
      .implements(HomeDataStore.self)
      .scope(Resolver.shared)
    #if DEBUG
    Resolver.register { StubNetworkWorker() }
      .implements(NetworkWorkerLogic.self)
      .scope(Resolver.application)
    #else
    Resolver.register { NetworkWorker() }
      .implements(NetworkWorkerLogic.self)
      .scope(Resolver.application)
    #endif
    Resolver.register { HomePresenter() }
      .implements(HomePresentationLogic.self)
  }
}
