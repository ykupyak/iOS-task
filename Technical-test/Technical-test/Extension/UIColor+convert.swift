//
//  UIColor+convert.swift
//  Technical-test
//
//  Created by Yaroslav Kupyak on 23.05.2023.
//

import UIKit

extension UIColor {
    static func fromString(_ colorString: String?) -> UIColor {
        switch (colorString ?? "").lowercased() {
        case "red":
            return UIColor.red
        case "green":
            return UIColor.green
        default:
            return UIColor.black
        }
    }
}
