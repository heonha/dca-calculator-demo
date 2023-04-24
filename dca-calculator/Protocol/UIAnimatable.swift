//
//  UIAnimatable.swift
//  dca-calculator
//
//  Created by Heonjin Ha on 2023/04/24.
//
import UIKit
import MBProgressHUD

protocol UIAnimatable where Self: UIViewController {

    func showLoadingIndicator()
    func hideLoadingIndicator()

}

extension UIAnimatable {

    func showLoadingIndicator() {
        DispatchQueue.main.async {
            MBProgressHUD.showAdded(to: self.view, animated: true)
        }
    }

    func hideLoadingIndicator() {
        DispatchQueue.main.async {
            MBProgressHUD.hide(for: self.view, animated: true)
        }
    }

}
