//
//  FeedCellNode.swift
//  InstaClone
//
//  Created by KIHYUN SO on 2020/12/26.
//

import AsyncDisplayKit

class FeedCellNode: ASCellNode {
  
  private let feedHeaderNode = FeedHeaderNode()
  private let feedImageNode = FeedImageNode()
  
  init(feed: Feed?) {
    super.init()
    automaticallyManagesSubnodes = true
    selectionStyle = .none
    feedHeaderNode.configure(feed: feed)
    feedImageNode.configure(feed: feed)
  }
  
  override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
    return ASStackLayoutSpec(
      direction: .vertical,
      spacing: 0,
      justifyContent: .start,
      alignItems: .stretch,
      children: [feedHeaderNode, feedImageNode]
    )
  }
}
