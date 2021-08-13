//
//  Avaliador.swift
//  Leilao
//
//  Created by Denis Carlos Lopes da Silva on 15/07/21.
//  Copyright © 2021 DenisLopes. All rights reserved.
//

import Foundation

enum ErroAvaliador: Error {
    case LeilaoSemLance(String)
}

class Avaliador {
    
    private var maiorDeTodos = Double.leastNonzeroMagnitude
    private var menorDeTodos = Double.greatestFiniteMagnitude
    private var maioresValores: [Lance] = []
    
    func verificarLeilaoSemLance(leilao: Leilao) throws {
        if leilao.lances?.count == 0 {
            throw ErroAvaliador.LeilaoSemLance("Não foi possivel avaliar um leilão sem lances")
        }
    }
    
    func avalia(leilao: Leilao) {
        guard let lances = leilao.lances else { return }
        for lance in lances {
            if lance.valor > maiorDeTodos {
                maiorDeTodos = lance.valor
            }
            if lance.valor < menorDeTodos {
                menorDeTodos = lance.valor
            }
        }
        
        maioresLancesNoLeilao(leilao)
    }
    
    func maiorLance() -> Double {
        return maiorDeTodos
    }
    
    func menorLance() -> Double {
        return menorDeTodos
    }
    
    func tresMaioresValores() -> [Lance] {
        return maioresValores
    }
    
    func maioresLancesNoLeilao(_ leilao: Leilao) {
        guard let lances = leilao.lances else { return }
        
        maioresValores = lances.sorted(by: { lista1, lista2 in
            return lista1.valor > lista2.valor
        })
        
        let maioresLances = maioresValores.prefix(3)
        maioresValores = Array(maioresLances)
    }
    
}
