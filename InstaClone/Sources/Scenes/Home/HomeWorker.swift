//
//  HomeWorker.swift
//  InstaClone
//
//  Created by KIHYUN SO on 2020/12/26.
//

import Foundation
import Resolver

protocol HomeWorkerLogic {
  func requestHome(completion: @escaping (Home?, Error?) -> Void)
}

final class HomeWorker: BaseWorker {
  
  @Injected var networkingService: NetworkingServiceType
  
}

extension HomeWorker: HomeWorkerLogic {
  func requestHome(completion: @escaping (Home?, Error?) -> Void) {
    networkingService.request(to: .home, type: Home.self) { (home, error) in
      completion(home, error)
    }
  }
}
