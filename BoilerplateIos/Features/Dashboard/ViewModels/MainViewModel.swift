//
//  Untitled.swift
//  BoilerplateIos
//
//  Created by outcode  on 29/11/2024.
//

import Foundation

final class MainViewModel: ObservableObject {
    @Published var products: [Product] = []

    func fetchProducts() {
        Task {
            do {
               // products = try await APIService.shared.fetchProducts()
            } catch {
                print("Error fetching products: \(error)")
            }
        }
    }
}
