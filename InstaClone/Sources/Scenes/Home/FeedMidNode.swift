//
//  FeedBottomNode.swift
//  InstaClone
//
//  Created by KIHYUN SO on 2020/12/26.
//

import AsyncDisplayKit

class FeedMidNode: BaseNode {
  fileprivate struct Metric {
    static let buttonSize: CGSize = .init(width: 30, height: 30)
  }
  
  private let likeButtonNode = ASButtonNode().then {
    $0.style.preferredSize = Metric.buttonSize
    $0.setImage(Image.Icon.like, for: .normal)
    $0.backgroundColor = .red
  }
  
  private let commentButtonNode = ASButtonNode().then {
    $0.style.preferredSize = Metric.buttonSize
    $0.setImage(Image.Icon.comment, for: .normal)
    $0.backgroundColor = .cyan
  }
  
  private let shareButtonNode = ASButtonNode().then {
    $0.style.preferredSize = Metric.buttonSize
    $0.setImage(Image.Icon.share, for: .normal)
    $0.backgroundColor = .blue
  }
  
  private let bookmarkButtonNode = ASButtonNode().then {
    $0.style.preferredSize = Metric.buttonSize
    $0.setImage(Image.Icon.bookmark, for: .normal)
    $0.backgroundColor = .brown
  }
  
  private let likeTextNode = ASTextNode()
  
  override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
    let likeButtonNodeWithLeftPadding = ASInsetLayoutSpec(
      insets: .init(top: 8, left: 16, bottom: 8, right: 0),
      child: likeButtonNode
    )
    
    let bookmarkButtonSpec = ASStackLayoutSpec(
      direction: .horizontal,
      spacing: 0,
      justifyContent: .end,
      alignItems: .end,
      children: [bookmarkButtonNode]
    )
    
    let bookmarkButtonNodeWithRightPadding = ASInsetLayoutSpec(
      insets: .init(top: 8, left: 0, bottom: 8, right: 16),
      child: bookmarkButtonSpec
    ).then {
      $0.style.flexGrow = 1
    }
    
    return ASStackLayoutSpec(
      direction: .horizontal,
      spacing: 8,
      justifyContent: .start,
      alignItems: .center,
      children: [
        likeButtonNodeWithLeftPadding,
        commentButtonNode,
        shareButtonNode,
        bookmarkButtonNodeWithRightPadding
      ]
    )
  }
  
  func configure(feed: Feed?) {
    let likeString = feed?.likes == 1 ? "\(feed?.likes ?? 0) like" : "\(feed?.likes ?? 0) likes"
    likeTextNode.attributedText = NSAttributedString(string: likeString)
  }
}
