//
//  ErrorHandler.swift
//  AYS
//
//  Created by Макаров Иван on 13.06.2018.
//  Copyright © 2018 Velvetech, LLC. All rights reserved.
//

import Foundation

import UIKit

protocol ErrorHandler {
    func showAlert(with title: String, message: String, handler: ((UIAlertAction) -> Void)?)
}

extension UIViewController: ErrorHandler {}

extension ErrorHandler where Self: UIViewController {
    
    func showAlert(with title: String, message: String, handler: ((UIAlertAction) -> Void)? = nil) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: handler)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
}
