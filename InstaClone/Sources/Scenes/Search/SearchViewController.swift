//
//  SearchViewController.swift
//  InstaClone
//
//  Created by KIHYUN SO on 2020/12/24.
//

import AsyncDisplayKit
import Resolver

protocol SearchDisplayLogic: class {
  
}

final class SearchViewController: BaseASViewController {
  
  // MARK: VIP
  
  @Injected var router: (SearchRoutingLogic & SearchDataPassing)
  @Injected var interactor: SearchBusinessLogic
  
  // MARK: Configuring
  
  override func configure() {
    super.configure()
    if let router = router as? SearchRouter,
       let interactor = interactor as? SearchInteractor,
       let presenter = interactor.presenter as? SearchPresenter {
      router.viewController = self
      presenter.view = self
    }
  }
}


// MARK: - Display Logic

extension SearchViewController: SearchDisplayLogic {
  
}
