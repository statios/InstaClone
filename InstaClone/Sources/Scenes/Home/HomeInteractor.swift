//
//  HomeInteractor.swift
//  InstaClone
//
//  Created by KIHYUN SO on 2020/12/24.
//

import Foundation

protocol HomeBusinessLogic: class {

}

protocol HomeDataStore: class {

}

final class HomeInteractor: HomeDataStore {

  var worker: HomeWorkerLogic?
  var presenter: HomePresentationLogic?

  deinit {
    debugPrint("DEINIT: HomeInteractor")
  }
}


// MARK: - Business Logic

extension HomeInteractor: HomeBusinessLogic {

}
