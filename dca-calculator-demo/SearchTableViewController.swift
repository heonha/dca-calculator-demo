//
//  SearchTableViewController.swift
//  dca-calculator-demo
//
//  Created by Heonjin Ha on 2023/03/24.
//

import UIKit

class SearchTableViewController: UITableViewController {

    // Search View Controller init
    lazy var searchController: UISearchController = {
        let sc = UISearchController(searchResultsController: nil)
        sc.searchResultsUpdater = self
        sc.delegate = self
        sc.obscuresBackgroundDuringPresentation = false // 프레젠테이션 중 배경을 흐리게 함
        sc.searchBar.placeholder = "회사명 또는 Symbol을 입력하세요."
        sc.searchBar.autocapitalizationType = .allCharacters // 대문자
        return sc
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        setupSearchController()
        // setup Search VC
    }

    private func setupSearchController() {
        navigationItem.searchController = searchController
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath)
        
        return cell
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }


}


extension SearchTableViewController: UISearchResultsUpdating, UISearchControllerDelegate {

    func updateSearchResults(for searchController: UISearchController) {
        //
    }



}
