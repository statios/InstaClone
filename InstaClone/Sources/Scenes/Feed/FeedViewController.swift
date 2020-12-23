//
//  FeedViewController.swift
//  InstaClone
//
//  Created by Stat on 2020/12/23.
//

import AsyncDisplayKit

protocol FeedDisplayLogic: class {

}

final class FeedViewController: BaseASViewController {

  // MARK: VIP

  var router: (FeedRoutingLogic & FeedDataPassing)?
  var interactor: FeedBusinessLogic?


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
    let interactor = FeedInteractor()
    let presenter = FeedPresenter()
    let router = FeedRouter()

    interactor.presenter = presenter
    interactor.worker = FeedWorker()

    presenter.view = viewController

    router.viewController = viewController
    router.dataStore = interactor

    viewController.interactor = interactor
    viewController.router = router
  }
}


// MARK: - Display Logic

extension FeedViewController: FeedDisplayLogic {

}
