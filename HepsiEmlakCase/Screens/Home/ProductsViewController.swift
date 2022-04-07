//
//  ProductsViewController.swift
//  HepsiEmlakCase
//
//  Created by cem sezeroglu on 27.03.2022.
//

import UIKit

protocol ProductsViewDisplayLogic {
    func display(viewModel: ProductsModels.GetProducts.ViewModel)
    func display(viewModel: ProductsModels.TapAddToChart.ViewModel)
    func display(viewModel: ProductsModels.EmptyResult.ViewModel)
    func display(viewModel: ProductsModels.ProductExistError.ViewModel)
    func display(viewModel: ProductsModels.TapImage.ViewModel)
}

class ProductsViewController: UIViewController, ProductsViewDisplayLogic {
    
    // MARK: Properties
    var interactor: ProductsViewBusinessLogic?
    var router: ProductsRoutingLogic?
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var cartButton: UIButton!
    
    let loading = ActivityManagerView()
    let activityIndicator = UIActivityIndicatorView()
    
    private struct Constant {
        static let extraSpacesForCell: CGFloat = 24.0
        static let cellHeight: CGFloat = 221.0
        static let cellEdges: UIEdgeInsets = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        static let minimumLineSpacingForSection: CGFloat = 8.0
        static let minimumInteritemSpacingForSectionAt: CGFloat = 1.0
    }
    
    private var productsList: [ProductsModels.Cell] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
        collectionView.delegate = self
        collectionView.dataSource = self
        loading.configureActivity(activityIndicator: activityIndicator, view: self.view)
        
        activityIndicator.startAnimating()
        interactor?.handle(request: ProductsModels.GetProducts.Request())
    }
    
    private func registerCell() {
        ProductCell.registerWithNib(to: collectionView)
    }
    
    func display(viewModel: ProductsModels.GetProducts.ViewModel) {
        self.productsList = viewModel.cell
        activityIndicator.stopAnimating()
        collectionView.reloadData()
    }
    
    func display(viewModel: ProductsModels.TapAddToChart.ViewModel) {
        if viewModel.isOutOfStock {
            showAlert(withTitle: "Uyarı", withMessage: viewModel.message)
        } else {
            ToastMessage.show(viewModel.message, align: .top(50))
            router?.routeToChart()
        }
    }
    
    func display(viewModel: ProductsModels.ProductExistError.ViewModel) {
        showAlert(withTitle: "Uyarı", withMessage: viewModel.message)
    }
    
    func display(viewModel: ProductsModels.EmptyResult.ViewModel) {
        activityIndicator.stopAnimating()
        showAlert(withTitle: "Uyarı", withMessage: viewModel.message)
    }
    
    func display(viewModel: ProductsModels.TapImage.ViewModel) {
        router?.routeToDetail(productImage: viewModel.image)
    }
    
    @IBAction func tapToChart(_ sender: Any) {
        router?.routeToChart()
    }
}

extension ProductsViewController: ProductCellDelegate {
    func didTapAddToChart(data: ProductsModels.Product) {
        interactor?.handle(request: ProductsModels.TapAddToChart.Request(selectedProduct: data))
    }
}

extension ProductsViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        productsList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let data = productsList[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: data.identifier(), for: indexPath)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let cells = productsList[indexPath.row]
        
        switch cells {
        case .productCell(let data):
            guard let cell = cell as? ProductCell else { return }
            cell.willDisplay(data: data)
            cell.delegate = self
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let data = productsList[indexPath.row]
        switch data {
        case .productCell(let data):
            interactor?.handle(request: ProductsModels.TapImage.Request(image: data.image ?? ""))
        }
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
