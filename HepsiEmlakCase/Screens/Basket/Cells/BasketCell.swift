//
//  BasketCell.swift
//  HepsiEmlakCase
//
//  Created by cem sezeroglu on 28.03.2022.
//

import UIKit

protocol BasketCellDelegate: AnyObject {
    func didPressRemove(index: Int, Id: Int)
}

class BasketCell: UITableViewCell {
    static let identifier = "BasketCell"

    @IBOutlet private weak var productImage: UIImageView!
    @IBOutlet private weak var ProductNameLabel: UILabel!
    @IBOutlet private weak var totalPriceLabel: UILabel!
    @IBOutlet private weak var removeButton: UIButton!
    @IBOutlet private weak var amountLabel: UILabel!
    @IBOutlet private weak var increaseButton: UIButton!
    @IBOutlet private weak var decreaseButton: UIButton!
    @IBOutlet weak var containerView: UIView!
    
    weak var delegate: BasketCellDelegate?
    
    private var index: Int?
    private var id: Int?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        apperance()
    }
    
    func willDisplay(data: BasketViewModels.BasketModel) {
        self.ProductNameLabel.text = data.name
        self.id = data.id
        self.index = data.index
        self.totalPriceLabel.text = data.price
        self.productImage.setImage(imgUrl: data.image)
    }
    
    private func apperance() {
        containerView.style(
            style: ViewStyle(
                backgroundColor: .white,
                tintColor: nil,
                layerStyle: ViewStyle.LayerStyle(
                    masksToBounds: true,
                    cornerRadius: 4.0,
                    borderStyle: ViewStyle.LayerStyle.BorderStyle(
                        color: Colors.productCellBorderColor,
                        width: 0.5
                    )
                )
            )
        )
    }
    
    @IBAction func tapRemove(_ sender: UIButton) {
        delegate?.didPressRemove(index: index ?? 0, Id: id ?? 0)
    }
}
