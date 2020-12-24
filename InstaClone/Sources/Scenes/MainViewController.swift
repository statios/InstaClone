//
//  MainView.swift
//  InstaClone
//
//  Created by KIHYUN SO on 2020/12/24.
//

import Foundation
import UIKit
import Resolver
import RxSwift

class MainViewController: UIViewController {
  let button = UIButton()
  
  var disposeBag = DisposeBag()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.addSubview(button)
    view.backgroundColor = .white
    button.translatesAutoresizingMaskIntoConstraints = false
    [button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
     button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
     button.widthAnchor.constraint(equalToConstant: 128),
     button.heightAnchor.constraint(equalToConstant: 128)
    ].forEach { $0.isActive = true }
    button.backgroundColor = .red
    button.rx.tap
      .subscribe(onNext: {
        self.navigationController?.pushViewController(HomeViewController(), animated: true)
      }).disposed(by: disposeBag)
  }
}
