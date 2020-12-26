//
//  AppResolver.swift
//  InstaClone
//
//  Created by KIHYUN SO on 2020/12/26.
//

import Foundation
import Resolver

class AppResolver: ResolverRegistering {
  static func registerAllServices() {
    Resolver.register { NetworkingService() }
      .implements(NetworkingServiceType.self)
      .scope(Resolver.application)
  }
}
