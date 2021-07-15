//
//  Leilao.swift
//  Leilao
//
//  Created by Denis Carlos Lopes da Silva on 15/07/21.
//  Copyright © 2021 DenisLopes. All rights reserved.
//

import Foundation

class Leilao {
    
    let descricao:String
    let imagem:String?
    var lances:[Lance]?
    
    init(descricao:String, imagem:String? = nil, lances:[Lance] = []) {
        self.descricao = descricao
        self.imagem = imagem
        self.lances = lances
    }
    
    func propoe(lance:Lance) {
        guard let listaDeLanches = lances else { return }
        if listaDeLanches.count == 0 || ultimoLance(listaDeLanches).usuario != lance.usuario {
            lances?.append(lance)
        }
        
    }
    
    private func ultimoLance(_ lances:[Lance]) -> Lance {
        return lances[lances.count-1]
    }
}
