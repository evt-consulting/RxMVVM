//
//  ViewModel.swift
//  RxMVVM
//
//  Created by Joao Schimmelpfeng on 08/11/17.
//  Copyright © 2017 EvolutionIt. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa


class ViewModel {
    var models = Variable<[Model]>([])
    let disposeBag = DisposeBag()
    
    func loadModels(){
        Service.fetchModels()
            .subscribe(onSuccess: { fetchData in
                self.models.value = fetchData
            })
            .disposed(by: disposeBag)
    }
    
    func addCell(){
        let model = Model(text: "Generic Model", title: "Model-X:")
        models.value.append(model)
    }
    
    func removeCell(){
        if models.value.count >= 1{
            models.value.removeLast()
        }
    }
    
}
