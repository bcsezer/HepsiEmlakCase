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
    
    private struct Constant {
        static let extraSpacesForCell: CGFloat = 24.0
        static let cellHeight: CGFloat = 221.0
        static let cellEdges: UIEdgeInsets = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        static let minimumLineSpacingForSection: CGFloat = 8.0
        static let minimumInteritemSpacingForSectionAt: CGFloat = 1.0
    }
    
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
        let basketVC = ViewControllerFactory.sharedInstance.makeBasketViewController()
        self.navigationController?.pushViewController(basketVC, animated: true)
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
        return CGSize(
            width: (collectionView.frame.width - Constant.extraSpacesForCell) / 2,
            height: Constant.cellHeight
        )
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        insetForSectionAt section: Int
    ) -> UIEdgeInsets {
        Constant.cellEdges
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumLineSpacingForSectionAt section: Int
    ) -> CGFloat {
        return Constant.minimumLineSpacingForSection
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumInteritemSpacingForSectionAt section: Int
    ) -> CGFloat {
        return Constant.minimumInteritemSpacingForSectionAt
    }
}
