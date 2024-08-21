//
//  ViewController.swift
//  POC
//
//  Created by Andre Firmo on 8/21/24.
//

import UIKit

class ViewController: UIViewController {

    lazy var tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.delegate = self
        table.dataSource = self
        table.separatorStyle = .none
        table.register(TableViewCell.self, forCellReuseIdentifier: "TableViewCell")
        return table
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let itemsCount = IconTitleItem.items.count
        let itemsPerRow: CGFloat = 2
        let itemHeight: CGFloat = 150
        let spacing: CGFloat = 12
        
        let numberOfRows = ceil(CGFloat(itemsCount) / itemsPerRow)
        let totalHeight = (numberOfRows * itemHeight) + ((numberOfRows - 1) * spacing) + (spacing * 2)
        
        return totalHeight
    }

}
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1 // Ajuste conforme necessário
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as? TableViewCell else {
            return UITableViewCell()
        }
        
            // Configure a célula conforme necessário
    // Passe os itens para a célula configurar a collectionView
        cell.configure(with: IconTitleItem.items)
        return cell
    }
    
}
