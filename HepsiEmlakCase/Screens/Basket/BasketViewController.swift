//
//  BasketViewController.swift
//  HepsiEmlakCase
//
//  Created by cem sezeroglu on 28.03.2022.
//

import UIKit

protocol BasketViewDisplayLogic {
    func display(viewModel: BasketViewModels.GetBasketList.ViewModel)
}

class BasketViewController: UIViewController, BasketViewDisplayLogic {
    var interactor: BasketViewBusinessLogic?
    var router: BasketRoutingLogic?
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        BasketCell.registerWithNib(to: tableView)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func display(viewModel: BasketViewModels.GetBasketList.ViewModel) {
        
    }
    
    @IBAction func TapBackButton(_ sender: UIButton) {
        router?.routeToBack()
    }
}

extension BasketViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: BasketCell.identifier, for: indexPath) as? BasketCell
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 142.0
    }
}

