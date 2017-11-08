//
//  TableCell.swift
//  RxMVVM
//
//  Created by Joao Schimmelpfeng on 08/11/17.
//  Copyright © 2017 EvolutionIt. All rights reserved.
//

import UIKit

class TableCell : UITableViewCell{
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var model:Model? {
        didSet {
            guard let model = model else { return }
            titleLabel.text = model.title
            descriptionLabel.text = model.text
        }
    }
}
