//
//  Service.swift
//  RxMVVM
//
//  Created by Joao Vitor on 08/11/17.
//  Copyright © 2017 EvolutionIt. All rights reserved.
//

import Foundation
import RxSwift

// Json mockup
var jsonMock = [["title":"Model-1:","text":"A nice model"],["title":"Model-2:","text":"A funny model"]]

class Service {
    
    static func fetchModels() -> Single<[Model]> {
        return Single<[Model]>.create { single in
             DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(3), execute: {
                
                var models:[Model] = []
                for i in jsonMock{
                    let model = Model.parseModel(json: i)
                    if model != nil {
                        models.append(model!)
                    }
                }
                single(.success(models))
                return
            })
            return Disposables.create { }
        }
    }
    
}
