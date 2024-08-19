//
//  SectionStrategy.swift
//  Hub
//
//  Created by Andre Firmo on 8/18/24.
//

import Foundation

protocol SectionStrategy {
    func numberOfItems(in section: Section) -> Int
    func configureCell(for item: Item, collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell
    func didSelectItem(at indexPath: IndexPath, in section: Section)
    func sizeForHeader(in section: Section) -> CGSize?
}
