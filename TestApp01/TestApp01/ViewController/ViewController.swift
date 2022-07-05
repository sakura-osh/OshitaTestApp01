//
//  ViewController.swift
//  TestApp01
//
//  Created by SakuraOshita on 2022/07/01.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    private var searchRepository: SearchRepositoryInterface
    private var indicator = UIActivityIndicatorView()
    private var items: [Item] = []
    
    init(searchRepository: SearchRepositoryInterface) {
        self.searchRepository = searchRepository
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        self.searchRepository = RepositoryLocator.getSearchRepository()
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    private func refreshTableView() {
        self.items = []
        tableView.reloadData()
    }


}

extension ViewController: UISearchBarDelegate {
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        searchBar.showsCancelButton = false
        return true
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = false
        view.endEditing(true)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        indicator.startAnimating()
        refreshTableView()
        
        if let searchText = searchBar.text {
            if searchText == "" {
                
            }
        }
    }
}
