//
//  AvaliadorTests.swift
//  LeilaoTests
//
//  Created by Denis Carlos Lopes da Silva on 15/07/21.
//  Copyright © 2021 DenisLopes. All rights reserved.
//

import XCTest
@testable import Leilao

class AvaliadorTests: XCTestCase {

    override func setUpWithError() throws {
        
    }

    override func tearDownWithError() throws {
        
    }
    
    func testLancesEmOrdemCrescente() {
        
        // Cenario
        
        let joao = Usuario(nome: "Joao")
        let jose = Usuario(nome: "Jose")
        let maria = Usuario(nome: "Maria")
        
        let leilao = Leilao(descricao: "Playstation 4")
        leilao.propoe(lance: Lance(maria, 250.0))
        leilao.propoe(lance: Lance(joao, 300.0))
        leilao.propoe(lance: Lance(jose, 400.0))
        
        // Acao
        
        let leiloeiro = Avaliador()
        leiloeiro.avalia(leilao: leilao)
        
        // Validacao
        
        XCTAssertEqual(250.0, leiloeiro.menorLance())
        XCTAssertEqual(400.0, leiloeiro.maiorLance())
        
    }
    
    func testLeilaoComApenasUmLance() {
        let joao = Usuario(nome: "Joao")
        let leilao = Leilao(descricao: "Bicicleta")
        leilao.propoe(lance: Lance(joao, 1000.0))
        
        let leiloiro = Avaliador()
        leiloiro.avalia(leilao: leilao)
        
        XCTAssertEqual(1000.0, leiloiro.menorLance())
        XCTAssertEqual(1000.0, leiloiro.maiorLance())
    }
    
    func testTresMaioresLances(){
        let joao = Usuario(nome: "Joao")
        let felipe = Usuario(nome: "felipe")
        
        let leilao = Leilao(descricao: "Carro")
        leilao.propoe(lance: Lance(joao, 500.0))
        leilao.propoe(lance: Lance(felipe, 600.0))
        leilao.propoe(lance: Lance(joao, 700.0))
        leilao.propoe(lance: Lance(felipe, 800.0))
        
        let leiloiro = Avaliador()
        leiloiro.avalia(leilao: leilao)
        
        let listaLances = leiloiro.tresMaioresValores()
        
        XCTAssertEqual(3, listaLances.count)
        XCTAssertEqual(800.0, listaLances[0].valor)
        XCTAssertEqual(700, listaLances[1].valor)
        XCTAssertEqual(600, listaLances[2].valor)
        
    }



}
