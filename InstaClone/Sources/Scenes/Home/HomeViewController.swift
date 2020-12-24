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


  // MARK: Initializing

  override init() {
    super.init()
    self.configure()
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }


  // MARK: Configuring

  private func configure() {
    let viewController = self
    let interactor = HomeInteractor()
    let presenter = HomePresenter()
    let router = HomeRouter()

    interactor.presenter = presenter
    interactor.worker = HomeWorker()

    presenter.view = viewController

    router.viewController = viewController
    router.dataStore = interactor

    viewController.interactor = interactor
    viewController.router = router
  }
}


// MARK: - Display Logic

extension HomeViewController: HomeDisplayLogic {

}
