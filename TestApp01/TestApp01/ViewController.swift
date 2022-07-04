//
//  ViewController.swift
//  TestApp01
//
//  Created by SakuraOshita on 2022/07/01.
//

import UIKit

class ViewController: UIViewController {

    private var tableView = UITableView()
    fileprivate var articles: [QiitaStruct] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "QiitaAPI"

        tableView.dataSource = self
        tableView.delegate = self
        tableView.frame = view.frame
        view.addSubview(tableView)
        QiitaViewModel.fetchArticle(completion: { (articles) in
            self.articles = articles
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

extension ViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        let article = articles[indexPath.row]
        cell.textLabel?.text = article.title
        cell.detailTextLabel?.text = article.user.name
        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }

}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print(articles[indexPath.row])
        QiitaItemViewModel.fetchArticle(itemId: articles[indexPath.row].id, completion: { (itemArticles) in
            print(itemArticles)
        })
    }
}
