//
//  HomeInteractor.swift
//  InstaClone
//
//  Created by KIHYUN SO on 2020/12/24.
//

import Foundation
import Resolver

protocol HomeBusinessLogic: class {

}

protocol HomeDataStore: class {

}

final class HomeInteractor: BaseInteractor, HomeDataStore {

  @Injected var networkWorker: NetworkWorkerLogic
  @Injected var presenter: HomePresentationLogic
  
}


// MARK: - Business Logic

extension HomeInteractor: HomeBusinessLogic {

}
