//
//  Feed.swift
//  InstaClone
//
//  Created by KIHYUN SO on 2020/12/24.
//

import Foundation

struct Home: Codable {
  let user: User
  let stories: [Story]
  let feeds: [Feed]
  
  enum CodingKeys: String, CodingKey {
    case user = "my_user"
    case stories
    case feeds = "news_feed"
  }
}
