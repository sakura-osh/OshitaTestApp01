//
//  SearchRepositoryInterface.swift
//  TestApp01
//
//  Created by SakuraOshita on 2022/07/05.
//

import Foundation

protocol SearchRepositoryInterface {
    func searchGitHubRepository(searchText: String) async throws -> [Item]
}
