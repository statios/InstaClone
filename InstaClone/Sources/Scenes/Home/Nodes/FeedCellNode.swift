//
//  FeedCellNode.swift
//  InstaClone
//
//  Created by KIHYUN SO on 2020/12/26.
//

import AsyncDisplayKit

class FeedCellNode: ASCellNode {
  
  private let feedTopNode = FeedTopNode()
  private let feedImageNode = FeedImageNode()
  private let feedMidNode = FeedMidNode()
  
  init(feed: Feed?) {
    super.init()
    automaticallyManagesSubnodes = true
    selectionStyle = .none
    feedTopNode.configure(feed: feed)
    feedImageNode.configure(feed: feed)
    feedMidNode.configure(feed: feed)
  }
  
  override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
    return ASStackLayoutSpec(
      direction: .vertical,
      spacing: 0,
      justifyContent: .start,
      alignItems: .stretch,
      children: [feedTopNode, feedImageNode, feedMidNode]
    )
  }
}
