//
//  HomeInteractor.swift
//  InstaClone
//
//  Created by KIHYUN SO on 2020/12/24.
//

import Foundation
import Resolver
import RxSwift
import RxCocoa

protocol HomeBusinessLogic: class {
  func home(request: Observable<HomeModels.Home.Request>)
}

protocol HomeDataStore: class {

}

final class HomeInteractor: BaseInteractor, HomeDataStore {

  @Injected var networkWorker: NetworkWorkerLogic
  @Injected var presenter: HomePresentationLogic

}


// MARK: - Business Logic

extension HomeInteractor: HomeBusinessLogic {
  func home(request: Observable<HomeModels.Home.Request>) {
    let response = networkWorker
      .request(to: .home, type: Home.self)
      .map { _ in HomeModels.Home.Response() }
    presenter.presentHome(response: response)
  }
}
