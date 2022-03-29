//
//  ProductCell.swift
//  HepsiEmlakCase
//
//  Created by cem sezeroglu on 27.03.2022.
//

import UIKit
import Kingfisher

protocol ProductCellDelegate: AnyObject {
    func didTapAddToChart()
}

class ProductCell: UICollectionViewCell {
    static let identifier = "ProductCell"
    
    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var productDescLabel: UILabel!
    @IBOutlet private weak var productImage: UIImageView!
    @IBOutlet private weak var productPriceLabel: UILabel!
    @IBOutlet private weak var addToChartButton: UIButton!
    
    weak var delegate: ProductCellDelegate?
    
    private struct Constants {
        static let borderWitdh: CGFloat = 0.5
        static let cornerRadious: CGFloat = 4.0
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        apperance()
    }
    
    func willDisplay(data: ProductsModels.Product) {
        self.productDescLabel.text = data.name
        self.productImage.setImage(imgUrl: data.image ?? "")
        self.productPriceLabel.text = "\(data.price ?? "") \(data.currency ?? "")"
    }
    
    private func apperance() {
        containerView.style(
            style: ViewStyle(
                backgroundColor: .white,
                tintColor: nil,
                layerStyle: ViewStyle.LayerStyle(
                    masksToBounds: true,
                    cornerRadius: Constants.cornerRadious,
                    borderStyle: ViewStyle.LayerStyle.BorderStyle(
                        color: Colors.productCellBorderColor,
                        width: Constants.borderWitdh
                    )
                )
            )
        )
        
        addToChartButton.style(
            style: ViewStyle(
                backgroundColor: Colors.orange,
                tintColor: nil,
                layerStyle: ViewStyle.LayerStyle(
                    masksToBounds: true,
                    cornerRadius: Constants.cornerRadious,
                    borderStyle: ViewStyle.LayerStyle.BorderStyle(
                        color: Colors.chartButtonBorderColor,
                        width: Constants.borderWitdh)
                )
            )
        )
        
        addToChartButton.style(
            style: TextStyle(
                font: UIFont.systemFont(ofSize: 12),
                color: Colors.white
            )
        )
    }
    
    @IBAction func tapAddToChart(_ sender: UIButton) {
        delegate?.didTapAddToChart()
    }
}
