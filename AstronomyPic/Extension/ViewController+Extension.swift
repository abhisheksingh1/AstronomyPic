//
//  ViewController+Extension.swift
//  AstronomyPic
//
//  Created by user on 29/11/21.
//

import Foundation
import UIKit

extension UIViewController {
    func showAlertMessage(_ title:String, _ message:String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
}
