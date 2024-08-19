//
//  MenuServiceConcrete.swift
//  Hub
//
//  Created by Andre Firmo on 8/18/24.
//

import Foundation

class MenuServiceConcrete: MenuService {
    init() {
        
    }
    
    func fetchSections(completion: @escaping (Result<[Section], any Error>) -> Void) {
        let bundle = Bundle(for: MenuServiceConcrete.self)
        
        guard let url = bundle.url(forResource: "mock", withExtension: "json") else {
            completion(.failure(NSError(domain: "File not found", code: 0, userInfo: nil)))
            return
        }
        
//        do {
            let data = try! Data(contentsOf: url)
            let response = try! JSONDecoder().decode(Response.self, from: data)
        completion(.success(response.data.sections))
//        } catch {
//            completion(.failure(error))
//        }
    }
}
