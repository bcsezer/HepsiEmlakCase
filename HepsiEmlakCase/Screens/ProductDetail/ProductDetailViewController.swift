//
//  ProductDetailViewController.swift
//  HepsiEmlakCase
//
//  Created by cem sezeroglu on 7.04.2022.
//

import UIKit
import Kingfisher

protocol ProductDetailDisplayLogic {
    func display(viewModel: ProductDettailModels.getDetail.ViewModel)
}

class ProductDetailViewController: UIViewController, ProductDetailDisplayLogic {
    var interactor: ProductsDetailBusinessLogic?
    
    @IBOutlet weak var productImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        interactor?.handle(request: ProductDettailModels.getDetail.Request())
    }

    func display(viewModel: ProductDettailModels.getDetail.ViewModel) {
        productImage.setImage(imgUrl: viewModel.image)
    }
}
