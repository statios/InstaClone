//
//  Story.swift
//  InstaClone
//
//  Created by KIHYUN SO on 2020/12/24.
//

import Foundation

struct Story: Codable {
  let user: User
  let isWatched: Bool
  
  enum CodingKeys: String, CodingKey {
    case user
    case isWatched = "is_watched"
  }
}
