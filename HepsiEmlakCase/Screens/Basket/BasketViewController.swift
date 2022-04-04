//
//  BasketViewController.swift
//  HepsiEmlakCase
//
//  Created by cem sezeroglu on 28.03.2022.
//

import UIKit

protocol BasketViewDisplayLogic {
    func display(viewModel: BasketViewModels.GetBasketList.ViewModel)
    func display(viewModel: BasketViewModels.TapRemove.ViewModel)
    func display(viewModel: BasketViewModels.TapDecrease.ViewModel)
    func display(viewModel: BasketViewModels.TapIncrease.ViewModel)
    func display(viewModel: BasketViewModels.EmptyList.ViewModel)
}

class BasketViewController: UIViewController, BasketViewDisplayLogic {
    var interactor: BasketViewBusinessLogic?
    var router: BasketRoutingLogic?
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var myBasketTitle: UILabel!
    @IBOutlet weak var totalPrice: UILabel!
    
    var basketItems: [BasketViewModels.BasketViewCell] = []
    
    private struct Constant {
        static let heightForRow: CGFloat = 147.0
        static let emptyCellHeight: CGFloat = 200.0
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        BasketCell.registerWithNib(to: tableView)
        EmptyBasketCell.registerWithNib(to: tableView)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        interactor?.handle(request: BasketViewModels.GetBasketList.Request())
    }
    
    @IBAction func tapPlaceOrder(_ sender: UIButton) {
        
    }
    
    
    func display(viewModel: BasketViewModels.GetBasketList.ViewModel) {
        self.basketItems = viewModel.cell
        myBasketTitle.text = "Sepetim (\(basketItems.count))"
        totalPrice.text = viewModel.totalPrice
        self.tableView.reloadData()
    }
    
    func display(viewModel: BasketViewModels.TapRemove.ViewModel) {
        self.basketItems.remove(at: viewModel.indexPath.row)
        myBasketTitle.text = "Sepetim (\(basketItems.count))"
        
        self.tableView.deleteRows(at: [viewModel.indexPath], with: .fade)
        tableView.reloadData()
    }
    
    func display(viewModel: BasketViewModels.TapIncrease.ViewModel) {
        interactor?.handle(request: BasketViewModels.GetBasketList.Request())
        tableView.reloadData()
//        let indexPath = IndexPath(row: viewModel.product.index, section: 0)
//        tableView.reloadRows(at: [indexPath], with: .automatic)
//        tableView.reloadData()
    }
    
    func display(viewModel: BasketViewModels.TapDecrease.ViewModel) {
        interactor?.handle(request: BasketViewModels.GetBasketList.Request())
        tableView.reloadData()
    }
    
    func display(viewModel: BasketViewModels.EmptyList.ViewModel) {
        self.basketItems = viewModel.cell
        tableView.isScrollEnabled = false
        tableView.reloadData()
    }
    
    @IBAction func TapBackButton(_ sender: UIButton) {
        router?.routeToBack()
    }
}

extension BasketViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        basketItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = basketItems[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: row.identifier())
        
        switch row {
        case .basketCell(let data):
            guard let cell = cell as? BasketCell else { return UITableViewCell() }
            cell.willDisplay(data: data)
            cell.delegate = self
            return cell
        case .emptyCell:
            guard let cell = cell as? EmptyBasketCell else { return UITableViewCell() }
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let row = basketItems[indexPath.row]
        
        switch row {
        case .basketCell:
            return Constant.heightForRow
        case .emptyCell:
            return Constant.emptyCellHeight
        }
    }
}

extension BasketViewController: BasketCellDelegate {
    func didPressIncrease(id: Int, Index: Int) {
        interactor?.handle(request: BasketViewModels.TapIncrease.Request(id: id, index: Index))
    }
    
    func didPressDecrease(id: Int, Index: Int) {
        interactor?.handle(request: BasketViewModels.TapDecrease.Request(id: id, index: Index))
    }
    
    func didPressRemove(index: Int, Id: Int) {
        interactor?.handle(request: BasketViewModels.TapRemove.Request(index: index, id: Id))
    }
}

