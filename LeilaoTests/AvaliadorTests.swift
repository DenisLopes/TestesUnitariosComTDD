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
    
    private var joao: Usuario!
    private var maria: Usuario!
    private var felipe: Usuario!
    private var leiloeiro: Avaliador!
    
    override func setUpWithError() throws {
        joao = Usuario(nome: "Joao")
        maria = Usuario(nome: "Maria")
        felipe = Usuario(nome: "felipe")
        leiloeiro = Avaliador()
        
    }

    override func tearDownWithError() throws {
        
    }
    
    func testLancesEmOrdemCrescente() {
        let leilao = CriarLeilao().para(descricao: "Carro")
            .lance(joao, 500.0)
            .lance(felipe, 600.0)
            .lance(maria, 700.0).construi()
        
       leiloeiro.avalia(leilao: leilao)
    
        XCTAssertEqual(500.0, leiloeiro.menorLance())
        XCTAssertEqual(700.0, leiloeiro.maiorLance())
        
    }
    
    func testLeilaoComApenasUmLance() {
        let leilao = CriarLeilao().para(descricao: "Video Game")
            .lance(joao, 1000.0).construi()
        
       leiloeiro.avalia(leilao: leilao)
        
        XCTAssertEqual(1000.0, leiloeiro.menorLance())
        XCTAssertEqual(1000.0, leiloeiro.maiorLance())
    }
    
    func testTresMaioresLances(){
        let leilao = CriarLeilao().para(descricao: "Ifhone 12")
            .lance(joao, 500.0)
            .lance(felipe, 600.0)
            .lance(joao, 700.0)
            .lance(felipe, 800.0).construi()
        
       leiloeiro.avalia(leilao: leilao)
        
        let listaLances = leiloeiro.tresMaioresValores()
        
        XCTAssertEqual(3, listaLances.count)
        XCTAssertEqual(800.0, listaLances[0].valor)
        XCTAssertEqual(700, listaLances[1].valor)
        XCTAssertEqual(600, listaLances[2].valor)
        
    }

    func testIgnorarLeilaoSemLance() {
        let leilao = CriarLeilao().para(descricao: "MacBook").construi()
        
        XCTAssertThrowsError(try leiloeiro.verificarLeilaoSemLance(leilao: leilao), "Não foi possivel avaliar um leilão sem lances") { (error) in
            print(error.localizedDescription)
        }
    }

}
