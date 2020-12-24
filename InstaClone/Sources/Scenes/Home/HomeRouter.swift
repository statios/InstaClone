//
//  HomeRouter.swift
//  InstaClone
//
//  Created by KIHYUN SO on 2020/12/24.
//

import UIKit
import Resolver

protocol HomeRoutingLogic: class {
  
}

protocol HomeDataPassing: class {

  var dataStore: HomeDataStore { get set }
}

final class HomeRouter: BaseRouter, HomeDataPassing {

  weak var viewController: HomeViewController?
  @Injected var dataStore: HomeDataStore
  
}


// MARK: - Routing Logic

extension HomeRouter: HomeRoutingLogic {

}
