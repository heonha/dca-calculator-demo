//
//  SearchResults.swift
//  dca-calculator-demo
//
//  Created by Heonjin Ha on 2023/03/26.
//

import Foundation

struct SearchResults: Decodable {

    let items: [SearchResult]

    enum CodingKeys: String, CodingKey {
        case items = "bestMatches"
    }

}

struct SearchResult: Decodable {
    let symbol: String
    let name: String
    let type: String
    let currency: String

    enum CodingKeys: String, CodingKey {
        case symbol = "1. symbol"
        case name = "2. name"
        case type = "3. type"
        case currency = "8. currency"
    }

}

// HTTP 요청
// https://www.alphavantage.co/query?function=SYMBOL_SEARCH&keywords=BA&apikey=API_KEY

// 본 API 데이터 구조
// bestMatches: [
//  {
//   "1. symbol": "BA",
//   "2. name": "Boeing Company",
//   "3. type": "Equity",
//   "4. region": "United States",
//   "5. marketOpen": "09:30",
//   "6. marketClose": "16:00",
//   "7. timezone": "UTC-04",
//   "8. currency": "USD",
//   "9. matchScore": "1.0000"
//  }
// ]

