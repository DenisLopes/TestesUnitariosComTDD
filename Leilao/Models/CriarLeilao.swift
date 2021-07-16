//
//  CriarLeilao.swift
//  Leilao
//
//  Created by Denis Carlos Lopes da Silva on 16/07/21.
//  Copyright © DenisLopes. All rights reserved.
//

import UIKit

class CriarLeilao: NSObject {
    
    private var leilao: Leilao!
    
    func para(descricao: String) -> Self {
        leilao = Leilao(descricao: descricao)
        
        return self
    }
    
    func lance(_ usuario: Usuario, _ valor: Double) -> Self {
        leilao.propoe(lance: Lance(usuario, valor))
        
        return self
    }
    
    func construi() -> Leilao {
        return leilao
    }

}
