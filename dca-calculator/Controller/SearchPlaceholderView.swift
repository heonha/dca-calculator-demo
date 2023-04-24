//
//  SearchPlaceholderView.swift
//  dca-calculator
//
//  Created by Heonjin Ha on 2023/04/16.
//

import UIKit

class SearchPlaceholderView: UIView {

    // ImageView - image imDCA - scaleAspectFit
    // title label - 14pt, line = 0
    // stackview - vstack imageview titlelabel, spacing 24, width super*0.8, x, y, height 88

    let imageView: UIImageView = {
        let image = UIImage(named: "imDca")!
        let iv = UIImageView(image: image)
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        return iv
    }()

    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Dollar-Cost Averaging이란? \n일정한 금액을 일정한 간격으로 투자하여 매매 시점의 가격 변동을 상쇄하려는 투자 전략입니다."
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 15)
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()

    lazy var stackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [imageView, titleLabel])
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.axis = .vertical
        sv.spacing = 24
        sv.alignment = .center
        return sv
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupLayout() {
        addSubview(stackView)

        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            stackView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.8),
            imageView.heightAnchor.constraint(equalToConstant: 88),
        ])
    }

}
