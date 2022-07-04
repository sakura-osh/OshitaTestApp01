//
//  QiitaStruct.swift
//  TestApp01
//
//  Created by SakuraOshita on 2022/07/01.
//

import Foundation

struct QiitaStruct: Codable {
    var title: String
    var user: User
    var id: String
    struct User: Codable {
        var name: String
    }
}
