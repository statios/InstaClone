//
//  FeedInteractor.swift
//  InstaClone
//
//  Created by Stat on 2020/12/23.
//

import Foundation

protocol FeedBusinessLogic: class {

}

protocol FeedDataStore: class {

}

final class FeedInteractor: FeedDataStore {

  var worker: FeedWorkerLogic?
  var presenter: FeedPresentationLogic?

  deinit {
    debugPrint("DEINIT: FeedInteractor")
  }
}


// MARK: - Business Logic

extension FeedInteractor: FeedBusinessLogic {

}
