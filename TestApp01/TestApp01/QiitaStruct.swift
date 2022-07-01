//
//  QiitaStruct.swift
//  TestApp01
//
//  Created by SakuraOshita on 2022/07/01.
//

struct QiitaStruct: Codable {
    var title: String
    var user: User
    struct User: Codable {
        var name: String
    }
}
