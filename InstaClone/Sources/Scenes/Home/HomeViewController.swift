//
//  HomeViewController.swift
//  InstaClone
//
//  Created by KIHYUN SO on 2020/12/26.
//

import AsyncDisplayKit

protocol HomeDisplayLogic: class {
  func displayFetchedHome(viewModel: HomeModels.FetchHome.ViewModel)
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
  
  override func sendRequest() {
    super.sendRequest()
    rx.viewDidLoad
      .subscribe(onNext: { [weak self] in
        self?.interactor?.fetchHome(request: .init())
      }).disposed(by: disposeBag)
  }
}


// MARK: - Display Logic

extension HomeViewController: HomeDisplayLogic {
  func displayFetchedHome(viewModel: HomeModels.FetchHome.ViewModel) {
    if let user = viewModel.user {
      //do display about user
    }
    if let stories = viewModel.stories {
      //do display about stories
    }
    if let feeds = viewModel.feeds {
      //do display about feeds
      Log.error(feeds.count)
    }
    if let errorMessage = viewModel.errorMessage {
      //show alert
      Log.error("error occur")
    }
  }
}
