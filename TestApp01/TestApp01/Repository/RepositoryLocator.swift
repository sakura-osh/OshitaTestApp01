//
//  RepositoryLocator.swift
//  TestApp01
//
//  Created by SakuraOshita on 2022/07/05.
//

import Foundation

class RepositoryLocator {
    static func getSearchRepository() -> SearchRepositoryInterface {
        return SearchRepository()
    }
}
