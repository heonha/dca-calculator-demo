//
//  SearchTableViewController.swift
//  dca-calculator-demo
//
//  Created by Heonjin Ha on 2023/03/24.
//

import UIKit
import Combine

class SearchTableViewController: UITableViewController {

    // 현재 뷰 모드
    private enum Mode {
        case search
        case onboarding
    }
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

    // Local variables
    private var searchResults: SearchResults?
    private let apiService = APIService()

    // Combine variables
    private var subscribers = Set<AnyCancellable>()
    @Published private var searchQuery = String()
    @Published private var mode: Mode = .onboarding


    override func viewDidLoad() {
        super.viewDidLoad()
        setupSearchController()
        observeForm()
    }

    private func setupSearchController() {
        navigationItem.searchController = searchController
    }

    private func observeForm() {

        $searchQuery
            .debounce(for: .milliseconds(750), scheduler: RunLoop.main)
            .sink { [unowned self] (searchQuery) in
                print(searchQuery)

                self.apiService.fetchSymbolsPublisher(keyword: searchQuery)
                    .sink { (completion) in
                        // 데이터스트림 완료시 처리할 코드
                        switch completion {
                        case .finished:
                            break
                        case .failure(let failure):
                            print(failure.localizedDescription)
                            return
                        }
                    } receiveValue: { (searchResults) in
                        // 데이터 스트림에서 발행된 데이터를 처리
                        print("데이터처리")
                        print(searchResults)
                        self.searchResults = searchResults
                        self.tableView.reloadData()

                    }
                    .store(in: &self.subscribers)
            }
            .store(in: &subscribers)

        $mode.sink { [unowned self] mode in
            switch mode {
            case .onboarding:
                let view = SearchPlaceholderView()
                self.tableView.backgroundView = view
            case .search:
                self.tableView.backgroundView = nil
            }
        }.store(in: &subscribers)


    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as? SearchTableViewCell else {return UITableViewCell()}

        guard let searchResults = searchResults else { return UITableViewCell() }

        let searchResult = searchResults.items[indexPath.row]
        cell.configure(with: searchResult)

        return cell
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResults?.items.count ?? 0
    }
}

extension SearchTableViewController: UISearchResultsUpdating, UISearchControllerDelegate {

    func updateSearchResults(for searchController: UISearchController) {
        guard let searchQuery = searchController.searchBar.text,
              !searchQuery.isEmpty else { return }

        self.searchQuery = searchQuery
    }

    func willPresentSearchController(_ searchController: UISearchController) {
        self.mode = .search
    }

    func willDismissSearchController(_ searchController: UISearchController) {
        self.mode = .onboarding
    }
}
