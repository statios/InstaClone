//
//  FeedHeaderNode.swift
//  InstaClone
//
//  Created by KIHYUN SO on 2020/12/26.
//

import AsyncDisplayKit

class FeedHeaderNode: BaseNode {
  
  private let profileImageNode = ASNetworkImageNode().then {
    let size = CGSize(width: 35, height: 35)
    $0.cornerRoundingType = .precomposited
    $0.cornerRadius = size.width / 2.0
    $0.style.preferredSize = size
  }
  private let nameTextNode = ASTextNode()
  
  override init() {
    super.init()
    
  }
  
  override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
    let imageSpec = ASInsetLayoutSpec(
      insets: .init(top: 8, left: 16, bottom: 8, right: 0),
      child: profileImageNode
    )
    return ASStackLayoutSpec(
      direction: .horizontal,
      spacing: 8,
      justifyContent: .start,
      alignItems: .center,
      children: [imageSpec, nameTextNode]
    )
  }
  
  func configure(feed: Feed?) {
    nameTextNode.attributedText = NSAttributedString(string: feed?.user.username ?? "")
    profileImageNode.url = URL(string: feed?.user.profileImageURL ?? "")
  }
}
