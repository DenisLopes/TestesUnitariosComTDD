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
    
    private var joao: Usuario!
    private var maria: Usuario!
    private var pedro: Usuario!
    private var joana: Usuario!
    
    
    override func setUp() {
        super.setUp()
        
        joao = Usuario(nome: "joao")
        maria = Usuario(nome: "maria")
        pedro = Usuario(nome: "pedro")
        joana = Usuario(nome: "joana")
        
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testReceberUmLance() {
        let leilaos = Leilao(descricao: "Iphone 12 Pro")
        XCTAssertEqual(0, leilaos.lances?.count)
        
        let leilao = CriarLeilao().para(descricao: "Iphone 12 Pro").lance(joao, 7000.0).construi()
        
        XCTAssertEqual(1, leilao.lances?.count)
        XCTAssertEqual(7000.0, leilao.lances?.first?.valor)
    }
    
    func testReceberVariosLances() {
        let leilao = CriarLeilao().para(descricao: "Carro")
            .lance(maria, 10000.0)
            .lance(pedro, 20000.0).construi()
        
        XCTAssertEqual(2, leilao.lances?.count)
        XCTAssertEqual(10000.0, leilao.lances?.first?.valor)
        XCTAssertEqual(20000.0, leilao.lances?[1].valor)
        
    }
    
    func testIgnorarDoislancesSeguidosDoMesmoUsuarios() {
        let leilao = CriarLeilao().para(descricao: "TV Sansung")
            .lance(joana, 10000.0)
            .lance(joana, 110000.0).construi()
        
        XCTAssertEqual(1, leilao.lances?.count)
        XCTAssertEqual(10000.0, leilao.lances?.first?.valor)
    }
    
    func testIgnorarMaisDe5LancesPorUsuarios() {
        let leilao = CriarLeilao().para(descricao: "MacBook")
            .lance(joao, 1000.0)
            .lance(joana, 2000.0)
            
            .lance(joao, 3000.0)
            .lance(joana, 4000.0)
            
            .lance(joao, 5000.0)
            .lance(joana, 6000.0)
            
            .lance(joao, 7000.0)
            .lance(joana, 8000.0)
            
            .lance(joao, 9000.0)
            .lance(joana, 10000.0).construi()
            
        
        _ = CriarLeilao().para(descricao: "MacBook")
            .lance(joao, 1000.0).construi()
        
        XCTAssertEqual(10, leilao.lances?.count)
        XCTAssertEqual(10000.0, leilao.lances?.last?.valor)
    }
    
}
