//
//  MenuCoordinator.swift
//  Hub
//
//  Created by Andre Firmo on 8/18/24.
//

import Foundation
import UIKit

public class MenuCoordinator {
    private lazy var menuVC: MenuViewController = {
        let vc = MenuViewController(viewModel: MenuViewModel(service: MenuServiceConcrete()))
        return vc
    }()
    
    private let navigationController: UINavigationController
    
    public init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    public func start() {
        navigationController.pushViewController(menuVC, animated: true)
    }
}
