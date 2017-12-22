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
var jsonMock = [["id":1,"title":"Model-1:","text":"A nice model"],["id":2,"title":"Model-2:","text":"A funny model"]]

class Service {
    
    static func fetchModels() -> Single<[Model]> {
        return Single<[Model]>.create { single in
             DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(3)) {
                
                var models:[Model] = []
                
                do{
                    for i in jsonMock {
                        let model = try Model.parseModel(json: i)
                        models.append(model)
                    }
                } catch {
                    print("Parsing error")
                }
                
                single(.success(models))
            }
            return Disposables.create { }
        }
    }
    
}
