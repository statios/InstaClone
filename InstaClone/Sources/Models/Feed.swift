//
//  Feed.swift
//  InstaClone
//
//  Created by KIHYUN SO on 2020/12/24.
//

import Foundation

struct Feed: Codable {
  let user: User
  let imageURL: String
  let aspectRatio: Double
  let likes: Int
  let lastComment: Comment
  let id: Int
  let dateAdded: Bool?
  
  enum CodingKeys: String, CodingKey{
    case user
    case likes
    case imageURL = "image_url"
    case aspectRatio = "aspect_ratio"
    case lastComment = "last_comment"
    case id = "post_id"
    case dateAdded
  }
}
