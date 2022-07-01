//
//  QiitaViewModel.swift
//  TestApp01
//
//  Created by SakuraOshita on 2022/07/01.
//

import Foundation

class QiitaViewModel {
    static func fetchArticle(completion: @escaping ([QiitaStruct]) -> Swift.Void) {

        let url = "https://qiita.com/api/v2/items"

        guard var urlComponents = URLComponents(string: url) else {
            return
        }

        urlComponents.queryItems = [
            URLQueryItem(name: "per_page", value: "50"),
        ]

        let task = URLSession.shared.dataTask(with: urlComponents.url!) { data, response, error in

            guard let jsonData = data else {
                return
            }

            do {
                let articles = try JSONDecoder().decode([QiitaStruct].self, from: jsonData)
                completion(articles)
            } catch {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
}
