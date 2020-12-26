//
//  FeedHeaderNode.swift
//  InstaClone
//
//  Created by KIHYUN SO on 2020/12/26.
//

import AsyncDisplayKit

class FeedTopNode: BaseNode {
  
  fileprivate struct Metric {
    static let profileImageSize: CGSize = .init(width: 35, height: 35)
    static let moreButtonSize: CGSize = .init(width: 10, height: 10)
  }
  
  private let profileImageNode = ASNetworkImageNode().then {
    $0.cornerRoundingType = .precomposited
    $0.cornerRadius = Metric.profileImageSize.width / 2.0
    $0.style.preferredSize = Metric.profileImageSize
    $0.backgroundColor = .red
  }
  private let nameTextNode = ASTextNode().then {
    $0.backgroundColor = .blue
  }
  private let moreButtonNode = ASButtonNode().then {
    $0.setImage(Image.Icon.elipse, for: .normal)
    $0.style.preferredSize = Metric.moreButtonSize
  }
  
  override init() {
    super.init()
  }
  
  override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
    let leftPadding = ASInsetLayoutSpec(
      insets: .init(top: 8, left: 16, bottom: 8, right: 0),
      child: profileImageNode
    )
    let moreButtonSpec = ASStackLayoutSpec(
      direction: .horizontal,
      spacing: 0,
      justifyContent: .end,
      alignItems: .end,
      children: [moreButtonNode]
    )
    let rightPadding = ASInsetLayoutSpec(
      insets: .init(top: 0, left: 0, bottom: 0, right: 16),
      child: moreButtonSpec
    ).then {
      $0.style.flexGrow = 1
    }
    return ASStackLayoutSpec(
      direction: .horizontal,
      spacing: 8,
      justifyContent: .start,
      alignItems: .center,
      children: [leftPadding, nameTextNode, rightPadding]
    )
  }
  
  func configure(feed: Feed?) {
    nameTextNode.attributedText = NSAttributedString(string: feed?.user.username ?? "")
    profileImageNode.url = URL(string: feed?.user.profileImageURL ?? "")
  }
}
