//
//  HomeInteractor.swift
//  InstaClone
//
//  Created by KIHYUN SO on 2020/12/26.
//

import Foundation

protocol HomeBusinessLogic: class {

}

protocol HomeDataStore: class {

}

final class HomeInteractor: BaseInteractor, HomeDataStore {

  var worker: HomeWorkerLogic?
  var presenter: HomePresentationLogic?

}


// MARK: - Business Logic

extension HomeInteractor: HomeBusinessLogic {

}
