//
//  Usuario.swift
//  Leilao
//
//  Created by Denis Carlos Lopes da Silva on 15/07/21.
//  Copyright © 2021 DenisLopes. All rights reserved.
//

import Foundation

class Usuario {
    
    let id:Int?
    let nome:String
    
    init(id:Int? = nil, nome:String) {
        self.id = id
        self.nome = nome
    }
}

extension Usuario:Equatable {
    static func == (lhs: Usuario, rhs: Usuario) -> Bool {
        
        if lhs.id != rhs.id || lhs.nome != rhs.nome {
            return false
        }
        return true
    }
    
    
}
