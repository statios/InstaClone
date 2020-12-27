//
//  FeedCellNode.swift
//  InstaClone
//
//  Created by KIHYUN SO on 2020/12/26.
//

import AsyncDisplayKit

class FeedCellNode: ASCellNode {
  
  private var feed: Feed?
  
  private let feedTopNode = FeedTopNode()
  private let feedImageNode = FeedImageNode()
  private let feedMidNode = FeedMidNode()
  private let feedLastCommentNode = FeedLastCommentNode()
  
  init(feed: Feed?) {
    super.init()
    self.feed = feed
    automaticallyManagesSubnodes = true
    selectionStyle = .none
    feedTopNode.configure(feed: feed)
    feedImageNode.configure(feed: feed)
    feedMidNode.configure(feed: feed)
    feedLastCommentNode.configure(feed: feed)
  }
  
  override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
    var layouts = [ASLayoutElement]()
    layouts.append(feedTopNode)
    layouts.append(feedImageNode)
    layouts.append(feedMidNode)
    
    if let likes = feed?.likes, likes > 0 {
      
    }
    
    if let _ = feed?.lastComment.user {
      layouts.append(feedLastCommentNode)
    }
    
    return ASStackLayoutSpec(
      direction: .vertical,
      spacing: 0,
      justifyContent: .start,
      alignItems: .stretch,
      children: layouts
    )
  }
}
