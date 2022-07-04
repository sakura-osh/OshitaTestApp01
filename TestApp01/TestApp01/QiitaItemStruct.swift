//
//  QiitaItemStruct.swift
//  TestApp01
//
//  Created by SakuraOshita on 2022/07/04.
//

import Foundation

struct QiitaItemStruct: Codable {
    var rendered_body: String
    var body: String
    var create_at: Data
    struct User: Codable {
        var name: String
    }
}
