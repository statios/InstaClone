//
//  HomePresenter.swift
//  InstaClone
//
//  Created by KIHYUN SO on 2020/12/24.
//

import UIKit
import RxSwift
import RxCocoa

protocol HomePresentationLogic: class {
  func presentHome(response: Single<HomeModels.Home.Response>)
}

final class HomePresenter: BasePresenter {
  
  weak var view: HomeDisplayLogic?
  
}


// MARK: - Presentation Logic

extension HomePresenter: HomePresentationLogic {
  func presentHome(response: Single<HomeModels.Home.Response>) {
    let viewModel = response
      .map { _ in HomeModels.Home.ViewModel() }
      .asDriver(onErrorJustReturn: HomeModels.Home.ViewModel() )
    view?.displayUpdateHome(viewModel: viewModel)
  }
}
