//
//  String+Extensions.swift
//  HepsiEmlakCase
//
//  Created by cem sezeroglu on 27.03.2022.
//

import Foundation
import UIKit

extension String {
    func stringToFloat() -> CGFloat? {
        guard let doubleValue = Double(self) else {
            return nil
        }
        return CGFloat(doubleValue)
    }
}
