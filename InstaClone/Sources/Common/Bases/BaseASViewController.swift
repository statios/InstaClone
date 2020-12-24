//
//  BaseASViewController.swift
//  InstaClone
//
//  Created by Stat on 2020/12/23.
//

import AsyncDisplayKit

class BaseASViewController: ASDKViewController<BaseNode> {
  override init() {
    super.init(node: BaseNode())
    Log.verbose(String(describing: Self.self))
  }
  
  deinit {
    Log.verbose(String(describing: Self.self))
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  @objc func configure() {
    
  }
}
