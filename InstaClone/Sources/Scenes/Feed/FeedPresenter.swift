//
//  FeedPresenter.swift
//  InstaClone
//
//  Created by Stat on 2020/12/23.
//

import UIKit

protocol FeedPresentationLogic: class {
  
}

final class FeedPresenter {
  
  weak var view: FeedDisplayLogic?
  
  deinit {
    debugPrint("DEINIT: FeedPresenter")
  }
}


// MARK: - Presentation Logic

extension FeedPresenter: FeedPresentationLogic {
  
}
