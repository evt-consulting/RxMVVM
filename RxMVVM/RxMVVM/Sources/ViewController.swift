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
    
    let viewModel = ViewModel()
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindUI()
        viewModel.loadModels()
    }
    
    func bindUI(){
        //Bind label
        viewModel.models.asDriver()
            .drive(onNext: { models in
            self.titleLabel.text = "\(models.count)"
        })
            .disposed(by: disposeBag)
        
        //Bind Tableview Datasource
        viewModel.models.asDriver()
            .drive(tableView.rx
            .items(cellIdentifier: "TableCell", cellType: TableCell.self)){
                row, model, cell in
                cell.model = model
        }
            .disposed(by: disposeBag)
    }

    @IBAction func addCell(_ sender: Any) {
        viewModel.addCell()
    }
    
    
    @IBAction func removeCell(_ sender: Any) {
        viewModel.removeCell()
    }
    
}

