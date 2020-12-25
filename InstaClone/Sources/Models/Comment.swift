//
//  Comment.swift
//  InstaClone
//
//  Created by KIHYUN SO on 2020/12/24.
//

import Foundation

struct Comment: Codable {
  let text: String?
  let user: User?
  
  enum CodingKeys: String, CodingKey{
    case user
    case text = "comment"
  }
}
