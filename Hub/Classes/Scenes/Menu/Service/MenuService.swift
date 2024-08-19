//
//  MenuService.swift
//  Hub
//
//  Created by Andre Firmo on 8/18/24.
//

import Foundation

protocol MenuService {
    func fetchSections(completion: @escaping (Result<[Section], Error>) -> Void)
}
