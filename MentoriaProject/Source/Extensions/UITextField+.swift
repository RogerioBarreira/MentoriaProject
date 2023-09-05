//
//  UITextField+.swift
//  MentoriaProject
//
//  Created by Rogerio Martins on 04/09/23.
//

import Foundation
import UIKit

extension UITextField {
    func setLeftPaddingPoints(_ amounts: CGFloat) {
        let padding: UIView = UIView(
            frame: CGRect(x: 0, y: 0, width: amounts,
                          height: self.frame.size.height)
        )
        self.leftView = padding
        self.leftViewMode = .always
    }
}
