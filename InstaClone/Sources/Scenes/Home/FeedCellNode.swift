//
//  FeedCellNode.swift
//  InstaClone
//
//  Created by KIHYUN SO on 2020/12/26.
//

import AsyncDisplayKit

class FeedCellNode: ASCellNode {
  
  private let feedImageNode = FeedImageNode()
  
  init(feed: Feed?) {
    super.init()
    automaticallyManagesSubnodes = true
    feedImageNode.configure(feed: feed)
  }
  
  override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
    return ASInsetLayoutSpec(insets: .zero, child: feedImageNode)
  }
}
