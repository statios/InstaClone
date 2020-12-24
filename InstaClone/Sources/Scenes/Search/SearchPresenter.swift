//
//  SearchPresenter.swift
//  InstaClone
//
//  Created by KIHYUN SO on 2020/12/24.
//

import UIKit

protocol SearchPresentationLogic: class {
  
}

final class SearchPresenter: BasePresenter {
  
  weak var view: SearchDisplayLogic?
  
}


// MARK: - Presentation Logic

extension SearchPresenter: SearchPresentationLogic {
  
}
