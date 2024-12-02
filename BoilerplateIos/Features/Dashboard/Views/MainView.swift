//
//  Main.swift
//  BoilerplateIos
//
//  Created by outcode  on 29/11/2024.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var viewModel: MainViewModel

    var body: some View {
        NavigationView {
            List(viewModel.products) { product in
               // ProductCard(product: product)
            }
            .navigationTitle("Products")
            .onAppear {
                viewModel.fetchProducts()
            }
        }
    }
}
