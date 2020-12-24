//
//  User.swift
//  InstaClone
//
//  Created by KIHYUN SO on 2020/12/24.
//

import Foundation

struct User: Codable {
  let id: Int
  let username: String
  let profileImage: String?
  
  enum CodingKeys: String, CodingKey {
    case id = "user_id"
    case username
    case profileImage = "profile_image_url"
  }
}
