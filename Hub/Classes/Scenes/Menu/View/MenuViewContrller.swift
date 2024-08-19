//
//  MenuViewController.swift
//  Hub
//
//  Created by Andre Firmo on 8/18/24.
//

import Foundation
import UIKit

class MenuViewController: UIViewController {
    let viewModel: MenuViewModel
    private lazy var menuView: MenuView = {
        let view = MenuView(viewModel: self.viewModel)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(menuView)
        NSLayoutConstraint.activate([
            menuView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            menuView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            menuView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            menuView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
        self.menuView.setupBindings()
    }
    
    override func loadView() {
        super.loadView()
        
    }
    
    init(viewModel: MenuViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
