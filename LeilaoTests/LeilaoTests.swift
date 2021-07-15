//
//  LeilaoTests.swift
//  LeilaoTests
//
//  Created by Denis Carlos Lopes da Silva on 15/07/21.
//  Copyright © 2021 DenisLopes. All rights reserved.
//

import XCTest
@testable import Leilao

class LeilaoTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testReceberUmLance() {
        
        let leilao = Leilao(descricao: "Iphone 12 Pro")
        XCTAssertEqual(0, leilao.lances?.count)
        
        let joao = Usuario(nome: "joao")
        leilao.propoe(lance: Lance(joao, 7000.0))
        
        XCTAssertEqual(1, leilao.lances?.count)
        XCTAssertEqual(7000.0, leilao.lances?.first?.valor)
    }
    
    func testReceberVariosLances() {
        
        let leilao = Leilao(descricao: "Carro")
        
        let maria = Usuario(nome: "maria")
        leilao.propoe(lance: Lance(maria, 10000.0))
        
        let pedro = Usuario(nome: "pedro")
        leilao.propoe(lance: Lance(pedro, 20000.0))
        
        XCTAssertEqual(2, leilao.lances?.count)
        XCTAssertEqual(10000.0, leilao.lances?.first?.valor)
        XCTAssertEqual(20000.0, leilao.lances?[1].valor)
        
    }
    
    func testIgnorarDoislancesSeguidosDoMesmoUsuarios() {
        
        let leilao = Leilao(descricao: "TV Sansung")
        
        let joana = Usuario(nome: "joana")
        leilao.propoe(lance: Lance(joana, 10000.0))
        leilao.propoe(lance: Lance(joana, 110000.0))
        
        XCTAssertEqual(1, leilao.lances?.count)
        XCTAssertEqual(10000.0, leilao.lances?.first?.valor)
        
    }
    
}
