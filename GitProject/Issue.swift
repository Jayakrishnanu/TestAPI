//
//  Issue.swift
//  GitProject
//
//  Created by Jayakrishnan u on 3/26/21.
//

import Foundation

struct Issue: Codable {
    let title: String
    
    enum CodingKeys: String, CodingKey {
        case title = "title"
    }
}
