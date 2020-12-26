//
//  HomeViewController.swift
//  InstaClone
//
//  Created by KIHYUN SO on 2020/12/26.
//

import AsyncDisplayKit

protocol HomeDisplayLogic: class {
  func displayFetchedHome(viewModel: HomeModels.FetchHome.ViewModel)
  func displayNetworkingError(viewModel: HomeModels.NetworkingError.ViewModel)
}

final class HomeViewController: BaseASViewController {

  // MARK: VIP

  var router: (HomeRoutingLogic & HomeDataPassing)?
  var interactor: HomeBusinessLogic?
  
  // MARK: DataStore
  
  var displayedFeeds: [Feed] = []
  
  // MARK: Nodes
  
  private lazy var tableNode = ASTableNode().then {
    $0.dataSource = self
  }
}

// MARK: - Configuring

extension HomeViewController {
  override func configure() {
    super.configure()
    let viewController = self
    let interactor = HomeInteractor()
    let presenter = HomePresenter()
    let router = HomeRouter()

    viewController.interactor = interactor
    viewController.router = router
    interactor.presenter = presenter
    interactor.networkingWorker = NetworkingWorker()
    presenter.view = viewController
    router.viewController = viewController
    router.dataStore = interactor
  }
}

// MARK: - Setup UI

extension HomeViewController {
  override func setupUI() {
    super.setupUI()
    node.addSubnode(tableNode)
    node.layoutSpecBlock = { (node, constrainedSize) in
      return ASInsetLayoutSpec(insets: .zero, child: self.tableNode)
    }
  }
}

// MARK: - Send Request

extension HomeViewController {
  override func sendRequest() {
    super.sendRequest()
    rx.viewWillAppear.take(1)
      .subscribe(onNext: { [weak self] _ in
        self?.interactor?.fetchHome(request: .init())
      }).disposed(by: disposeBag)
  }
}

// MARK: - Display Logic

extension HomeViewController: HomeDisplayLogic {
  func displayFetchedHome(viewModel: HomeModels.FetchHome.ViewModel) {
    self.displayedFeeds = viewModel.feeds
    self.tableNode.reloadData()
  }
  func displayNetworkingError(viewModel: HomeModels.NetworkingError.ViewModel) {
    
  }
}

// MARK: - ASTableDataSource

extension HomeViewController: ASTableDataSource {
  func tableNode(_ tableNode: ASTableNode, numberOfRowsInSection section: Int) -> Int {
    return displayedFeeds.count
  }
  
  func tableNode(_ tableNode: ASTableNode, nodeBlockForRowAt indexPath: IndexPath) -> ASCellNodeBlock {
    return { [weak self] in
      let item = self?.displayedFeeds[indexPath.row]
      let cell = FeedCellNode(feed: item)
      return cell
    }
  }
}
