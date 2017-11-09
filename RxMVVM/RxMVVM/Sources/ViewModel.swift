//
//  ViewModel.swift
//  RxMVVM
//
//  Created by Joao Schimmelpfeng on 08/11/17.
//  Copyright © 2017 EvolutionIt. All rights reserved.
//

import Foundation
import RxSwift

class ViewModel {
    var models = Variable<[Model]>([])
    var showActivityIndicator = Variable<Bool>(false)
    
    let disposeBag = DisposeBag()
    
    func loadModels() {
        showActivityIndicator.value = true
        Service.fetchModels()
            .subscribe(onSuccess: { fetchData in
                self.models.value = fetchData
                self.showActivityIndicator.value = false
            })
            .disposed(by: disposeBag)
    }
    
    func addCell() {
        var model = Model(id: 0)
        model.text = "Generic Model"
        model.title = "Model-X:"
        models.value.append(model)
    }
    
    func removeCell() {
        if models.value.count >= 1{
            models.value.removeLast()
        }
    }
    
}
