//
//  Model.swift
//  RxMVVM
//
//  Created by Joao Schimmelpfeng on 08/11/17.
//  Copyright © 2017 EvolutionIt. All rights reserved.
//
enum ParseError: Error {
    case requiredParameterNotProvided
}


struct Model {
    var id: Int
    var text: String? = nil
    var title: String? = nil
    
    init(id: Int) {
        self.id = id
    }
    
    static func parseModel(json: [String:Any]) throws -> Model {
        guard let id = json["id"] as? Int else {
            throw ParseError.requiredParameterNotProvided
        }
        
        var model = Model(id: id)
        model.title = json["title"] as? String
        model.text = json["text"] as? String
        
        return model
    }
}
