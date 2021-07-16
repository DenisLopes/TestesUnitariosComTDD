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
        guard let listaDeLances = lances else { return }
        if listaDeLances.count == 0 || podeDarLance(lance.usuario, listaDeLances) {
            lances?.append(lance)
        }
        
    }
    
    private func podeDarLance(_ usuario: Usuario, _ listaDeLances:[Lance]) -> Bool {
        return ultimoLance(listaDeLances).usuario != usuario && quantidadeLancesDoUsuarios(usuario) < 5
    }
    
    private func ultimoLance(_ lances:[Lance]) -> Lance {
        return lances[lances.count-1]
    }
    
    private func quantidadeLancesDoUsuarios(_ usuario: Usuario) -> Int {
        guard let listaDeLanches = lances else { return 0 }
        
        var total = 0
        for lanceAtual in listaDeLanches {
            if lanceAtual.usuario == usuario {
                total += 1
            }
        }
        return total
    }
    
}
