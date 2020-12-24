//
//  HomeWorker.swift
//  InstaClone
//
//  Created by KIHYUN SO on 2020/12/24.
//

import Foundation

protocol HomeWorkerLogic {

}

final class HomeWorker: HomeWorkerLogic {
  
  deinit {
    debugPrint("DEINIT: HomeWorker")
  }
  
  func doSomeWork() {
    
  }
}
