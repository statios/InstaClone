//
//  SearchInteractor.swift
//  InstaClone
//
//  Created by KIHYUN SO on 2020/12/24.
//

import Foundation
import Resolver

protocol SearchBusinessLogic: class {

}

protocol SearchDataStore: class {

}

final class SearchInteractor: BaseInteractor, SearchDataStore {

  @Injected var presenter: SearchPresentationLogic?
  
}


// MARK: - Business Logic

extension SearchInteractor: SearchBusinessLogic {

}
