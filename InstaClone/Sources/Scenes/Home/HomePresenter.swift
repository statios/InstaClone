//
//  HomePresenter.swift
//  InstaClone
//
//  Created by KIHYUN SO on 2020/12/26.
//

import UIKit

protocol HomePresentationLogic: class {
  func presentFetchedHome(response: HomeModels.FetchHome.Response)
}

final class HomePresenter: BasePresenter {
  
  weak var view: HomeDisplayLogic?

}


// MARK: - Presentation Logic

extension HomePresenter: HomePresentationLogic {
  func presentFetchedHome(response: HomeModels.FetchHome.Response) {
    if let home = response.home {
      view?.displayFetchedHome(
        viewModel: .init(user: home.user, stories: home.stories, feeds: home.feeds)
      )
    }
    if let error = response.error {
      view?.displayNetworkingError(
        viewModel: .init(message: error.localizedDescription)
      )
    }
  }
}
