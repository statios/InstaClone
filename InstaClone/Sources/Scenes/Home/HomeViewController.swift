//
//  HomeViewController.swift
//  InstaClone
//
//  Created by KIHYUN SO on 2020/12/26.
//

import AsyncDisplayKit

protocol HomeDisplayLogic: class {

}

final class HomeViewController: BaseASViewController {

  // MARK: VIP

  var router: (HomeRoutingLogic & HomeDataPassing)?
  var interactor: HomeBusinessLogic?

  // MARK: Configuring
  
  override func configure() {
    super.configure()
    let viewController = self
    let interactor = HomeInteractor()
    let presenter = HomePresenter()
    let router = HomeRouter()

    viewController.interactor = interactor
    viewController.router = router
    interactor.presenter = presenter
    interactor.worker = HomeWorker()
    presenter.view = viewController
    router.viewController = viewController
    router.dataStore = interactor
  }
}


// MARK: - Display Logic

extension HomeViewController: HomeDisplayLogic {

}
