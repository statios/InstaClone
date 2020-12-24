//
//  HomeRouter.swift
//  InstaClone
//
//  Created by KIHYUN SO on 2020/12/24.
//

import UIKit

protocol HomeRoutingLogic: class {

}

protocol HomeDataPassing: class {

  var dataStore: HomeDataStore? { get set }
}

final class HomeRouter: HomeDataPassing {

  weak var viewController: HomeViewController?
  var dataStore: HomeDataStore?

  deinit {
    debugPrint("DEINIT: HomeRouter")
  }
}


// MARK: - Routing Logic

extension HomeRouter: HomeRoutingLogic {

}
