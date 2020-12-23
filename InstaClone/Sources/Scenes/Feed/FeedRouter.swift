//
//  FeedRouter.swift
//  InstaClone
//
//  Created by Stat on 2020/12/23.
//

import UIKit

protocol FeedRoutingLogic: class {

}

protocol FeedDataPassing: class {

  var dataStore: FeedDataStore? { get set }
}

final class FeedRouter: FeedDataPassing {

  weak var viewController: FeedViewController?
  var dataStore: FeedDataStore?

  deinit {
    debugPrint("DEINIT: FeedRouter")
  }
}


// MARK: - Routing Logic

extension FeedRouter: FeedRoutingLogic {

}
