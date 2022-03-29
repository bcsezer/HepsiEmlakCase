//
//  Styles.swift
//  HepsiEmlakCase
//
//  Created by cem sezeroglu on 29.03.2022.
//

import UIKit

enum Font {
    static func withSize(size: CGFloat, weight: UIFont.Weight) -> UIFont {
        return UIFont.systemFont(ofSize: size, weight: weight)
    }
}

struct TextStyle {
    let font: UIFont
    let color: UIColor
}

struct ViewStyle {
    
    struct LayerStyle {
        
        struct BorderStyle {
            let color: UIColor
            let width: CGFloat
        }
        
        let masksToBounds: Bool?
        let cornerRadius: CGFloat?
        let borderStyle: BorderStyle?
    }
    
    let backgroundColor: UIColor?
    let tintColor: UIColor?
    let layerStyle: LayerStyle?
}
