//
//  QiitaItemViewModel.swift
//  TestApp01
//
//  Created by SakuraOshita on 2022/07/04.
//

import Foundation

class QiitaItemViewModel {
    static func fetchArticle(itemId: String, completion: @escaping ([QiitaItemStruct]) -> Swift.Void) {

        let url = "https://qiita.com/api/v2/items/:" + itemId

        guard var urlComponents = URLComponents(string: url) else {
            return
        }

        let task = URLSession.shared.dataTask(with: urlComponents.url!) { data, response, error in

            guard let jsonData = data else {
                return
            }

            do {
                let articles = try JSONDecoder().decode([QiitaItemStruct].self, from: jsonData)
                completion(articles)
            } catch {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
}
