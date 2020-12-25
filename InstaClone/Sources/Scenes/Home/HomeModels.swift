//
//  HomeModels.swift
//  InstaClone
//
//  Created by KIHYUN SO on 2020/12/26.
//

enum HomeModels {

  enum FetchHome {
    struct Request {

    }
    struct Response {
      let home: Home
    }

    struct ViewModel {
      let user: User
      let stories: [Story]
      let feeds: [Feed]
    }
  }
}
