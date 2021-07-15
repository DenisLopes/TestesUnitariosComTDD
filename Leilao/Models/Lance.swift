//
//  Lance.swift
//  Leilao
//
//  Created by Ândriu Coelho on 15/07/21.
//  Copyright © 2021 DenisLopes. All rights reserved.
//

import Foundation

class Lance {
    
    let usuario:Usuario
    let valor:Double
    
    init(_ usuario:Usuario, _ valor:Double) {
        self.usuario = usuario
        self.valor = valor
    }
}
