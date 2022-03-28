//
//  ProductCell.swift
//  HepsiEmlakCase
//
//  Created by cem sezeroglu on 27.03.2022.
//

import UIKit

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
        static let borderWitdh: CGFloat = 1.0
        static let cornerRadious: CGFloat = 3.0
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        apperance()
    }
    
    func willDisplay(data: ProductsModels.Product) {
        self.productDescLabel.text = data.name
        self.productImage.image = UIImage()
        self.productPriceLabel.text = data.price
    }
    
    private func apperance() {
        containerView.layer.borderWidth = Constants.borderWitdh
        containerView.layer.borderColor = Colors.productCellBorderColor.cgColor
        containerView.layer.cornerRadius = Constants.cornerRadious
        
        addToChartButton.layer.borderWidth = Constants.borderWitdh
        addToChartButton.layer.cornerRadius = Constants.cornerRadious
        addToChartButton.layer.borderColor = Colors.chartButtonBorderColor.cgColor
        addToChartButton.layer.backgroundColor = Colors.orange.cgColor
        addToChartButton.setTitleColor(Colors.white, for: .normal)
    }
    
    @IBAction func tapAddToChart(_ sender: UIButton) {
        delegate?.didTapAddToChart()
    }
}
