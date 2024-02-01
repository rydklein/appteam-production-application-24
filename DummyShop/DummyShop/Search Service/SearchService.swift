//
//  SearchService.swift
//  DummyShop
//
//  Created by Ryder Klein on 1/31/24.
//

import Foundation

// Stole this from Choosey kind of...

class SearchService {
    private static let session = URLSession.shared
    public static func searchProducts(term: String) async throws -> [Product] {
        var components = URLComponents(string: "https://dummyjson.com/products/search")!
        components.queryItems = [URLQueryItem(name: "q", value: "\(term)")]
        guard let url = components.url else { fatalError("Invalid URL") }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "accept")
        let (data, _) = try await session.data(for: request)
        let response = try JSONDecoder().decode(DummyJSONResponse.self, from: data)
        return response.products
    }
    
    private static func printData(data: Data) {
        let string = String(data: data, encoding: .utf8)!
        print(string)
    }
    
    private struct DummyJSONResponse: Codable {
        let products: [Product]
    }
}
