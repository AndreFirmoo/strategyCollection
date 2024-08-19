//
//  AvailableProductSectionStrategy.swift
//  Hub
//
//  Created by Andre Firmo on 8/18/24.
//

import Foundation

class AvailableProductSectionStrategy:SectionStrategy {
    func sizeForHeader(in section: Section) -> CGSize? {
        nil
    }
    
    func numberOfItems(in section: Section) -> Int {
        return section.items.count
    }
    
    func configureCell(for item: Item, collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AvailableProductCell", for: indexPath) as! AvailableProductCell
        cell.configure(with: item)
        return cell
    }
    
    func didSelectItem(at indexPath: IndexPath, in section: Section) {
            // Ação quando um item de Feedback é selecionado
        print("Available item selected: \(section.items[indexPath.item].name)")
    }
}


