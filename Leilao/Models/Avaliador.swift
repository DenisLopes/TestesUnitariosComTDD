//
//  Avaliador.swift
//  Leilao
//
//  Created by Ândriu Coelho on 15/07/21.
//  Copyright © 2021 DenisLopes. All rights reserved.
//

import Foundation

class Avaliador {
    
    private var maiorDeTodos = Double.leastNonzeroMagnitude
    private var menorDeTodos = Double.greatestFiniteMagnitude
    
    func avalia(leilao:Leilao) {
        guard let lances = leilao.lances else { return }
        
        for lance in lances {
            if lance.valor > maiorDeTodos {
                maiorDeTodos = lance.valor
            }
            else if lance.valor < menorDeTodos {
                menorDeTodos = lance.valor
            }
        }
    }
    
    func maiorLance() -> Double {
        return maiorDeTodos
    }
    
    func menorLance() -> Double {
        return menorDeTodos
    }
    
}
