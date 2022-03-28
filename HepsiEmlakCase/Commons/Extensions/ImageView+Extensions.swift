//
//  ImageView+Extensions.swift
//  HepsiEmlakCase
//
//  Created by cem sezeroglu on 28.03.2022.
//

import UIKit
import Kingfisher

extension UIImageView{
    func setImage(imgUrl: String) {
        self.kf.setImage(with: URL(string: imgUrl))
    }
}
