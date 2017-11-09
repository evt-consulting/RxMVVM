//
//  ViewController.swift
//  RxMVVM
//
//  Created by Joao Schimmelpfeng on 08/11/17.
//  Copyright © 2017 EvolutionIt. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    var actIndicator: UIActivityIndicatorView!
    var grayView: UIView!
    
    let viewModel = ViewModel()
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Configure Activty gray view
        grayView = UIView(frame: self.view.frame)
        grayView.center = self.view.center
        grayView.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.332443882)
        grayView.isHidden = true
        view.addSubview(grayView)
        
        //Configure Activity Indicator
        actIndicator = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        actIndicator.center = self.view.center
        actIndicator.hidesWhenStopped = true
        actIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.whiteLarge
        view.addSubview(actIndicator)
        
        bindUI()
        viewModel.loadModels()
    }
    
    func bindUI() {
        
        // Bind label
        viewModel.models.asDriver()
            .map { "\($0.count)" }
            .drive(titleLabel.rx.text)
            .disposed(by: disposeBag)
        
        // Bind Tableview Datasource
        viewModel.models.asDriver()
            .drive(tableView.rx
            .items(cellIdentifier: "TableCell", cellType: TableCell.self)) {
                row, model, cell in
                
                cell.model = model
            }
            .disposed(by: disposeBag)
        
        // Bind Activity Indicator
        viewModel.showActivityIndicator.asDriver()
            .drive(actIndicator.rx.isAnimating)
            .disposed(by: disposeBag)
        
        viewModel.showActivityIndicator.asDriver()
            .map { !$0 }
            .drive(grayView.rx.isHidden)
            .disposed(by: disposeBag)
        
    }

    @IBAction func addCell(_ sender: Any) {
        viewModel.addCell()
    }
    
    
    @IBAction func removeCell(_ sender: Any) {
        viewModel.removeCell()
    }
    
}

