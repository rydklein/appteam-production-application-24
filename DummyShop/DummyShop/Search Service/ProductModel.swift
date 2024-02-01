//
//  ProductModel.swift
//  DummyShop
//
//  Created by Ryder Klein on 1/31/24.
//

import Foundation

class Product: Codable, Identifiable {
    let id: Int
    let title: String
    let description: String
    // Cents
    let price: Double
    let discountPercentage: Double
    let rating: Double
    let thumbnail: String
}
