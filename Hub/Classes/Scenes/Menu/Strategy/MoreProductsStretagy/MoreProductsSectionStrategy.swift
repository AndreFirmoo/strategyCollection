//
//  MoreProductsSectionStrategy.swift
//  Hub
//
//  Created by Andre Firmo on 8/18/24.
//

import Foundation
class MaisProdutosSectionStrategy: SectionStrategy {
    func sizeForHeader(in section: Section) -> CGSize? {
        nil
    }
    
    func numberOfItems(in section: Section) -> Int {
        return 1 // Mostrando apenas um item que representa a seção
    }
    
    func configureCell(for item: Item, collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MaisProdutosCell", for: indexPath) as! MaisProdutosCell
            // Configure o título da seção
        cell.configure(with: item.name)
        return cell
    }
    
    func didSelectItem(at indexPath: IndexPath, in section: Section) {
            // Navegar para a próxima tela com os itens de "Mais Produtos"
        print("Navigating to more products screen with \(section.items.count) items.")
    }
}
