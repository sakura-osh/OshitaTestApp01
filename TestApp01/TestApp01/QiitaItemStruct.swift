//
//  QiitaItemStruct.swift
//  TestApp01
//
//  Created by SakuraOshita on 2022/07/04.
//

import Foundation

struct QiitaItemStruct: Codable {
//    var create_at: String
    struct User: Codable {
        var name: String
    }
}
