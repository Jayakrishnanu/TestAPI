//
//  Projects.swift
//  GitProject
//
//  Created by Jayakrishnan u on 3/26/21.
//

import Foundation

struct Projects: Codable {
    let name: String
    let fullName: String
    let url: String?
    let description: String
    let language: String?
    let stars: Int?
    
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case fullName = "full_name"
        case url = "homePage"
        case description = "description"
        case language = "language"
        case stars = "stargazers_count"
    }
}
