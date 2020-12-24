//
//  HomeViewController.swift
//  InstaClone
//
//  Created by KIHYUN SO on 2020/12/24.
//

import AsyncDisplayKit
import Resolver

protocol HomeDisplayLogic: class {
  
}

final class HomeViewController: BaseASViewController {
  
  // MARK: VIP
  
  @Injected var router: (HomeRoutingLogic & HomeDataPassing)
  @Injected var interactor: HomeBusinessLogic

  // MARK: Configuring
  
  override func configure() {
    super.configure()
    if let router = router as? HomeRouter,
       let interactor = interactor as? HomeInteractor,
       let presenter = interactor.presenter as? HomePresenter {
      router.viewController = self
      presenter.view = self
    }
  }
}


// MARK: - Display Logic

extension HomeViewController: HomeDisplayLogic {
  
}
