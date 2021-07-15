//
//  Usuario.swift
//  Leilao
//
//  Created by Ândriu Coelho on 15/07/21.
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
