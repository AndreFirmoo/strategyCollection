//
//  ContractedProductSectionStrategy.swift
//  Hub
//
//  Created by Andre Firmo on 8/18/24.
//

import Foundation

class ContractedProductSectionStrategy: SectionStrategy {
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

