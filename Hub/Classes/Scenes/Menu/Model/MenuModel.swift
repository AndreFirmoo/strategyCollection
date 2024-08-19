//
//  MenuModel.swift
//  Hub
//
//  Created by Andre Firmo on 8/18/24.
//

import Foundation

class Section: Codable {
    let type: SectionType
    let name: String
    let items: [Item]
}

enum SectionType: String, Codable {
    case feedback = "FeedBack"
    case produtosContratados = "ProdutosContratados"
    case produtosDisponiveis = "ProdutosDisponiveis"
    case maisProdutos = "MaisProdutos"
}

class Item: Codable {
    let icon: String
    let name: String
}

struct DataContainer: Decodable {
    let sections: [Section]
}

struct Response: Decodable {
    let data: DataContainer
}
