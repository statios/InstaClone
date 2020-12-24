//
//  SearchRouter.swift
//  InstaClone
//
//  Created by KIHYUN SO on 2020/12/24.
//

import UIKit
import Resolver

protocol SearchRoutingLogic: class {

}

protocol SearchDataPassing: class {

  var dataStore: SearchDataStore { get set }
}

final class SearchRouter: BaseRouter, SearchDataPassing {

  weak var viewController: SearchViewController?
  @Injected var dataStore: SearchDataStore

}


// MARK: - Routing Logic

extension SearchRouter: SearchRoutingLogic {

}
