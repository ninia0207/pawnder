//
//  Models.swift
//  pawnder
//
//  Created by Ninia Sabadze on 12.04.23.
//

import Foundation

enum Gender{
    case make, female
}
struct User{
    let username: String
    let bio: String
    let name: (first: String, last: String)
    let birthDate: Date
    let gender: Gender
    let counts: UserCount
    let joinDate: Date
}

struct UserCount{
    let followers: Int
    let following: Int
    let posts: Int
}

///Represents a user post
public struct PhotoPost{
    let identifier: String
    let thumbnailImage: URL
    let postURL: URL
    let caption: String?
    let createdDate: Date
}
