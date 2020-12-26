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
    view?.displayFetchedHome(
      viewModel: .init(
        user: response.home?.user,
        stories: response.home?.stories,
        feeds: response.home?.feeds,
        errorMessage: response.error?.localizedDescription
      )
    )
  }
}
