//
//  MenuViewModel.swift
//  Hub
//
//  Created by Andre Firmo on 8/18/24.
//

import Foundation

class MenuViewModel {
    private let service: MenuService
    private var sections: [Section] = []
    private var strategy: [SectionType: SectionStrategy] = [:]
    
    var reload: (() -> Void)?
    
    init(service: MenuService) {
        self.service = service
        setupStrategy()
    }
    
    private func setupStrategy() {
        self.strategy[.feedback] = FeedbackSectionStrategy()
        self.strategy[.maisProdutos] = MaisProdutosSectionStrategy()
        self.strategy[.produtosContratados] = ContractedProductSectionStrategy()
        self.strategy[.produtosDisponiveis] = AvailableProductSectionStrategy()
    }
    
    func loadSections() {
        service.fetchSections { [weak self] result in
            switch result {
                case .success(let success):
                    self?.sections = success
                    self?.reload?()
                case .failure(let failure):
                    print("errro")
            }
        }
    }
    
    func numberOfSections() -> Int {
        print("sections \(sections.count)")
        return sections.count
    }
    
    func numberOfItems(in section: Int) -> Int {
        let section = sections[section]
        print("section \(strategy[section.type]) have \(strategy[section.type]!.numberOfItems(in: section))")
        return strategy[section.type]?.numberOfItems(in: section) ?? 0
    }
    
    func configureCell(for indexPath: IndexPath, in collectionView: UICollectionView) -> UICollectionViewCell {
        let section = sections[indexPath.section]
        let item = section.items[indexPath.item]
        return strategy[section.type]?.configureCell(for: item, collectionView: collectionView, indexPath: indexPath) ?? UICollectionViewCell()
    }
    
    func didSelectItem(at indexPath: IndexPath) {
        let section = sections[indexPath.section]
        strategy[section.type]?.didSelectItem(at: indexPath, in: section)
    }
    
}
