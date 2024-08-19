//
//  ContractedProductSectionStrategy.swift
//  Hub
//
//  Created by Andre Firmo on 8/18/24.
//

import Foundation

class ContractedProductSectionStrategy: SectionStrategy {
    func sizeForHeader(in section: Section) -> CGSize? {
        return CGSize(width: UIScreen.main.bounds.width, height: 100)  // Exibir um header com 100 de altura
    }
    
    func numberOfItems(in section: Section) -> Int {
        return section.items.count
    }
    
    func configureCell(for item: Item, collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ContractedProductCell", for: indexPath) as! ContractedProductCell
        cell.configure(with: item)
        return cell
    }
    
    func didSelectItem(at indexPath: IndexPath, in section: Section) {
            // Ação quando um item de Feedback é selecionado
        print("Contract item selected: \(section.items[indexPath.item].name)")
    }
}

