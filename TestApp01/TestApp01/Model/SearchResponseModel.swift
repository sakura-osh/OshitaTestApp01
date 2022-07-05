//
//  SearchResponseModel.swift
//  TestApp01
//
//  Created by SakuraOshita on 2022/07/05.
//

import Foundation

struct SearchResponseModel: Decodable {
    var items: [Item]
}

struct Item: Decodable {
    var full_name: String
    var description: String?
}
