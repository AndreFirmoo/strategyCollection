//
//  TableViewCell.swift
//  POC
//
//  Created by Andre Firmo on 8/21/24.
//

import UIKit

class TableViewCell: UITableViewCell {
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 150, height: 150)
        layout.minimumInteritemSpacing = 12
        layout.minimumLineSpacing = 12
        layout.sectionInset = UIEdgeInsets(top: 12, left: 24, bottom: 12, right: 24)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.isUserInteractionEnabled = true
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.isScrollEnabled = false // Desabilite o scroll da collectionView
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: "CollectionViewCell")
        return collectionView
    }()
    
    private var items: [IconTitleItem] = []
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)

        contentView.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
        
        contentView.bringSubviewToFront(collectionView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with items: [IconTitleItem]) {
        self.items = items
        collectionView.reloadData()
    }
}

extension TableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as? CollectionViewCell else {
            return UICollectionViewCell()
        }
        let item = items[indexPath.item]
        cell.configure(with: item.iconName, title: item.title)
        
        return cell
    }
}

extension TableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 150, height: 150)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedItem = items[indexPath.item]
        print("Item selecionado: \(selectedItem.title)")
            // Você pode implementar alguma ação específica aqui, como chamar um delegate ou notificar a ViewController
    }
}


struct IconTitleItem {
    let iconName: String
    let title: String
    
    static let items: [IconTitleItem] = [
        IconTitleItem(iconName: "star", title: "Favoritos"),
        IconTitleItem(iconName: "heart", title: "Amor"),
        IconTitleItem(iconName: "house", title: "Casa"),
        IconTitleItem(iconName: "car", title: "Carro"),
        IconTitleItem(iconName: "pencil", title: "Editar"),
        IconTitleItem(iconName: "bell", title: "Notificações"),
        IconTitleItem(iconName: "gear", title: "Configurações"),
        IconTitleItem(iconName: "phone", title: "Telefone"),
        IconTitleItem(iconName: "envelope", title: "Email"),
        IconTitleItem(iconName: "camera", title: "Câmera"),
        IconTitleItem(iconName: "trash", title: "Lixeira"),
        IconTitleItem(iconName: "paperplane", title: "Enviar"),
        IconTitleItem(iconName: "globe", title: "Mundo"),
        IconTitleItem(iconName: "clock", title: "Relógio"),
        IconTitleItem(iconName: "bookmark", title: "Marcador"),
        IconTitleItem(iconName: "flag", title: "Bandeira"),
        IconTitleItem(iconName: "lock", title: "Segurança"),
        IconTitleItem(iconName: "wifi", title: "Wi-Fi"),
        IconTitleItem(iconName: "battery.100", title: "Bateria"),
        IconTitleItem(iconName: "music.note", title: "Música")
    ]

}
