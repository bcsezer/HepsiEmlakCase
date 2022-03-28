//
//  ProductsViewController.swift
//  HepsiEmlakCase
//
//  Created by cem sezeroglu on 27.03.2022.
//

import UIKit

protocol ProductsViewDisplayLogic {
    func display(viewModel: ProductsModels.GetProducts.ViewModel)
}

class ProductsViewController: UIViewController, ProductsViewDisplayLogic {
    
    // MARK: Properties
    var interactor: ProductsViewBusinessLogic?
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
        collectionView.delegate = self
        collectionView.dataSource = self
        
        interactor?.handle(request: ProductsModels.GetProducts.Request(test: "Test Data"))
    }
    
    private func registerCell() {
        ProductCell.registerWithNib(to: collectionView)
    }
    
    func display(viewModel: ProductsModels.GetProducts.ViewModel) {
        print(viewModel.test)
    }
}

extension ProductsViewController: ProductCellDelegate {
    func didTapAddToChart() {
        let vc = BasketViewController.loadFromNib()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension ProductsViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCell.identifier, for: indexPath) as? ProductCell
        cell?.delegate = self
        cell?.willDisplay(data: ProductsModels.Product(id: 0, name: "Chevron Tempoered Glass Guard for Lenovo K6 Power", price: "75₺", currency: "₺", image: ""))
        
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        return CGSize(width: (collectionView.frame.width - 24) / 2, height: CGFloat(221))
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        insetForSectionAt section: Int
    ) -> UIEdgeInsets {
        UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumLineSpacingForSectionAt section: Int
    ) -> CGFloat {
        CGFloat(8)
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumInteritemSpacingForSectionAt section: Int
    ) -> CGFloat {
       return CGFloat(1)
    }
}
