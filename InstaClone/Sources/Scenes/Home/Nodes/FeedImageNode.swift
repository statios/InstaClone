//
//  FeedImageNode.swift
//  InstaClone
//
//  Created by KIHYUN SO on 2020/12/26.
//

import AsyncDisplayKit

class FeedImageNode: BaseNode {
  private let imageNode = ASNetworkImageNode()
  
  override init() {
    super.init()
    imageNode.style.preferredSize.width = Device.width
  }
  
  override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
    return ASInsetLayoutSpec(insets: .zero, child: imageNode)
  }
  
  func configure(feed: Feed?) {
    imageNode.url = URL(string: feed?.imageURL ?? "")
    imageNode.style.preferredSize.height = Device.width * CGFloat(feed?.aspectRatio ?? 1.0)
  }
}
