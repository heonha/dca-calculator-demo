//
//  SearchTableViewCell.swift
//  dca-calculator-demo
//
//  Created by Heonjin Ha on 2023/03/25.
//

import UIKit

class SearchTableViewCell: UITableViewCell {

    @IBOutlet weak var assetNameLabel: UILabel!
    @IBOutlet weak var assetSymbolLabel: UILabel!
    @IBOutlet weak var assetTypeLabel: UILabel!

    func configure(with searchResult: SearchResult) {
        assetNameLabel.text = searchResult.name
        assetSymbolLabel.text = searchResult.symbol
        assetTypeLabel.text = searchResult.type
            .appending(" ")
            .appending(searchResult.currency)
    }
}
