//
//  Model.swift
//  RxMVVM
//
//  Created by Joao Schimmelpfeng on 08/11/17.
//  Copyright © 2017 EvolutionIt. All rights reserved.
//

struct Model {
    var text = ""
    var title = ""
    
    
    static func parseModel(json: [String:Any]) -> Model?{
        guard let title = json["title"] as? String,
            let text = json["text"] as? String else {
            return nil
        }
        
        let model = Model(text: text, title: title)
        return model
    }
}
