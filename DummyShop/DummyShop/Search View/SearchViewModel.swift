//
//  SearchViewModel.swift
//  DummyShop
//
//  Created by Ryder Klein on 1/29/24.
//

import SwiftUI

@MainActor
class SearchViewModel: ObservableObject {
    @Published var searchText = ""
    // Useful for testing: .error(error: CancellationError())
    @Published var searchState: SearchState = .idle
    var debounceTimer: Timer?

    public func textChanged() {
        if let debounceTimer = debounceTimer {
            debounceTimer.invalidate()
        }
        debounceTimer = Timer.scheduledTimer(withTimeInterval: 0.2, repeats: false) { _ in
            Task {
                await self.initiateSearch()
            }
        }
    }

    public func initiateSearch() async {
        if (searchText.isEmpty) {
            searchState = .idle
            return
        }
        searchState = .loading
        do {
            let results = try await SearchService.searchProducts(term: searchText)
            searchState = .success(data: results)
        } catch {
            searchState = .error(error: error)
        }
    }
}

enum SearchState {
    case idle
    case loading
    case success(data: [Product])
    case error(error: Error)
}
