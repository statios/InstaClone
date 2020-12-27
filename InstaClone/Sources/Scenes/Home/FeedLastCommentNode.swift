//
//  FeedLastCommentNode.swift
//  InstaClone
//
//  Created by KIHYUN SO on 2020/12/27.
//

import AsyncDisplayKit

class FeedLastCommentNode: BaseNode {
  fileprivate struct Metric {
    static let imageSize: CGSize = .init(width: 20, height: 20)
  }
  
  private let imageNode = ASNetworkImageNode().then {
    $0.style.preferredSize = Metric.imageSize
    $0.cornerRoundingType = .precomposited
    $0.cornerRadius = Metric.imageSize.width / 2
    $0.backgroundColor = .red
  }
  
  private let nameNode = ASTextNode().then {
    $0.backgroundColor = .blue
  }
  
  private let commentNode = ASTextNode().then {
    $0.backgroundColor = .brown
  }
  
  override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
    let hStack = ASStackLayoutSpec(
      direction: .vertical,
      spacing: 8,
      justifyContent: .start,
      alignItems: .stretch,
      children: [nameNode, commentNode]
    ).then {
      $0.style.flexGrow = 1
      $0.style.flexShrink = 1
    }
    
    let layoutSpec = ASStackLayoutSpec(
      direction: .horizontal,
      spacing: 8,
      justifyContent: .start,
      alignItems: .stretch,
      children: [imageNode, hStack]
    )
    
    return ASInsetLayoutSpec(
      insets: .init(top: 0, left: 16, bottom: 8, right: 16),
      child: layoutSpec
    )
  }
  
  func configure(feed: Feed?) {
    imageNode.url = URL(string: feed?.lastComment.user?.profileImageURL ?? "")
    nameNode.attributedText = NSAttributedString(
      string: feed?.lastComment.user?.username ?? "",
      attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 13)]
    )
    commentNode.attributedText = NSAttributedString(
      string: feed?.lastComment.text ?? "",
      attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13)]
    )
  }
}
