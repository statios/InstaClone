//
//  HomePresenter.swift
//  InstaClone
//
//  Created by KIHYUN SO on 2020/12/24.
//

import UIKit

protocol HomePresentationLogic: class {
  
}

final class HomePresenter {
  
  weak var view: HomeDisplayLogic?
  
  deinit {
    debugPrint("DEINIT: HomePresenter")
  }
}


// MARK: - Presentation Logic

extension HomePresenter: HomePresentationLogic {
  
}
