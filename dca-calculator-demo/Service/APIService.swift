//
//  APIService.swift
//  dca-calculator-demo
//
//  Created by Heonjin Ha on 2023/03/25.
//

import Foundation
import Combine

struct APIService {

    var API_KEY: String {
        return keys.randomElement() ?? ""
    }

    let keys = [ APIKeys.API_KEY, APIKeys.API_KEY2, APIKeys.API_KEY3 ]

    // MARK: - Combine

    // 키워드에 따라 결과를 AnyPublisher를  리턴함.
    func fetchSymbolsPublisher(keyword: String) -> AnyPublisher<SearchResults, Error> {

        let urlString = "https://www.alphavantage.co/query?function=SYMBOL_SEARCH&keywords=\(keyword)&apikey=\(API_KEY)"

        let url = URL(string: urlString)!

        let session = URLSession.shared.dataTaskPublisher(for: url)
            .map{ $0.data } // data만 추출
            .decode(type: SearchResults.self, decoder: JSONDecoder()) // 디코딩
            .receive(on: RunLoop.main) // 비동기 코드 메인스레드 예약 DispatchQueue.global().async { DispatchQueue.main.async {...} }
            .eraseToAnyPublisher()

        return session
    }

}
