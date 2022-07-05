//
//  SearchRepository.swift
//  TestApp01
//
//  Created by SakuraOshita on 2022/07/05.
//

import Foundation

class SearchRepository: SearchRepositoryInterface {
    private let searchRepositoryDataStore = SearchRepositoryDataStore()
    
    func searchGitHubRepository(searchText: String) async throws -> [Item] {
        do {
            let response = try await searchRepositoryDataStore.searchRepositories(query: searchText)
            let items = response.items
            return items
        }
        catch(let error) {
            throw error
        }
    }
}
