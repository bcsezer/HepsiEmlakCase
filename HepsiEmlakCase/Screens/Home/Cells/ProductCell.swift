//
//  ProductCell.swift
//  HepsiEmlakCase
//
//  Created by cem sezeroglu on 27.03.2022.
//

import UIKit
import Kingfisher

protocol ProductCellDelegate: AnyObject {
    func didTapAddToChart(data: ProductsModels.Product)
}

class ProductCell: UICollectionViewCell {
    static let identifier = "ProductCell"
    
    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var productDescLabel: UILabel!
    @IBOutlet private weak var productImage: UIImageView!
    @IBOutlet private weak var productPriceLabel: UILabel!
    @IBOutlet private weak var addToChartButton: UIButton!
    
    weak var delegate: ProductCellDelegate?
    
    private var product: ProductsModels.Product?
    
    private struct Constants {
        static let borderWitdh: CGFloat = 0.5
        static let cornerRadious: CGFloat = 4.0
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        apperance()
    }
    
    private var id: Int?
    
    func willDisplay(data: ProductsModels.Product) {
        self.productDescLabel.text = data.name
        self.productPriceLabel.text = data.price
        self.id = data.id ?? 0
        
        guard let imageUrl = data.image else {
            self.productImage.image = UIImage(named: "no-image")
            return
        }
        self.productImage.setImage(imgUrl: imageUrl)
        loadProduct(data: data)
    }
    
    private func loadProduct(data: ProductsModels.Product) {
        self.product = data
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
        guard let selectedProduct = product else {
            return
        }
        delegate?.didTapAddToChart(data: selectedProduct)
    }
}
