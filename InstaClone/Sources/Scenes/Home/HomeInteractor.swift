//
//  HomeInteractor.swift
//  InstaClone
//
//  Created by KIHYUN SO on 2020/12/26.
//

import Foundation

protocol HomeBusinessLogic: class {
  func fetchHome(request: HomeModels.FetchHome.Request)
}

protocol HomeDataStore: class {

}

final class HomeInteractor: BaseInteractor, HomeDataStore {

  var worker: HomeWorkerLogic?
  var presenter: HomePresentationLogic?

}


// MARK: - Business Logic

extension HomeInteractor: HomeBusinessLogic {
  func fetchHome(request: HomeModels.FetchHome.Request) {
    worker?.requestHome { [weak self] home in
      self?.presenter?.presentFetchedHome(response: .init(home: home))
    }
  }
}
