//
//  SearchView.swift
//  DummyShop
//
//  Created by Ryder Klein on 1/29/24.
//

import Foundation

import SwiftUI

struct SearchView: View {
    @StateObject var vm = SearchViewModel()
    var body: some View {
        VStack {
            header
            Spacer()
            results
            Spacer()
            bottomBar
        }
    }

    var header: some View {
        VStack {
            HStack {
                Image(systemName: "chevron.left")
                    .font(.title2)
                    .foregroundStyle(.background)
                ZStack {
                    Capsule()
                        .foregroundStyle(.background)
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .font(.callout)
                            .fontWeight(.light)
                        Spacer()
                        TextField(text: $vm.searchText) {
                            Text("Search")
                        }
                        .onChange(of: vm.searchText) {
                            vm.textChanged()
                        }
                        Image(systemName: "barcode.viewfinder")
                    }
                    .padding([.leading, .trailing])
                }
                .frame(height: 30)
                ZStack(alignment: .topTrailing) {
                    Image(systemName: "cart")
                        .font(.title2)
                        .foregroundStyle(.background)
                    ZStack(alignment: .center) {
                        Circle()
                            .stroke(.black)
                            .fill(.yellow)
                        // I know this is like two pixels to the left but I have more important things to do unfortunately
                        Text("0")
                            .font(.system(size: 10))
                            .foregroundStyle(.black)
                    }.frame(width: 12, height: 12)
                }
            }
            .padding(.bottom)
            HStack(alignment: .center, spacing: .zero) {
                ZStack {
                    Circle()
                        .fill(.cyan)
                        .frame(width: 20, height: 20)
                    Image(systemName: "truck.box")
                        .font(.system(size: 10))
                        .foregroundStyle(.background)
                }
                .padding(.trailing, 10)
                Group {
                    Text("How do you want your items?")
                    Text("  | ")
                        .fontWeight(.light)
                    Text("27514")
                }
                .font(.subheadline)
                .foregroundStyle(.background)
                Spacer()
                Image(systemName: "chevron.down")
                    .foregroundStyle(.background)
            }
        }
        .padding()
        .background(Color.blue)
    }

    var results: some View {
        VStack(alignment: .leading) {
            switch vm.searchState {
            case .idle:
                Spacer()
                Text("Start typing above to search.")
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            case .loading:
                Spacer()
                ProgressView()
            case .error(let error):
                Spacer()
                VStack(alignment: .center, spacing: 5) {
                    VStack {
                        Image(systemName: "x.circle")
                            .foregroundStyle(.red)
                            .padding(.bottom, 1)
                        Text("Error loading data.")
                    }
                    Text(error.localizedDescription)
                        .font(.footnote)
                        .multilineTextAlignment(.center)
                    Button(action: {
                        Task {
                            await vm.initiateSearch()
                        }
                    }) {
                        Image(systemName: "arrow.circlepath")
                            .font(.title2)
                    }
                }
            case .success(let products):
                Group {
                    HStack(alignment: .firstTextBaseline, spacing: .zero) {
                        Text("Results for \"\(vm.searchText)\"")
                            .font(.title3)
                            .bold()
                        Text("(\(products.count))")
                            .font(.subheadline)
                            .foregroundStyle(.gray)
                            .padding(.leading, 6)
                        Spacer()
                    }
                    .padding(.bottom, 1)
                    HStack(spacing: .zero) {
                        Text("Price when purchased online ")
                        Image(systemName: "info.circle")
                    }
                    .font(.footnote)
                }
                .padding([.leading, .trailing])
                Spacer()
                // Initialize GeometryReader here and pass it into ScrollView/ProductView to avoid ScrollView dimension weirdness
                if !products.isEmpty {
                    GeometryReader { geo in
                        List(Array(products.enumerated()), id: \.offset) { _, product in
                            ProductView(product: product, geo: geo)
                        }
                        .listStyle(.plain)
                    }
                }
                else {
                    HStack(alignment: .center) {
                        Spacer()
                        Text("No products found.")
                            .font(.footnote)
                            .foregroundStyle(.secondary)
                        Spacer()
                    }
                }
            }
            Spacer()
        }
    }

    var bottomBar: some View {
        // TODO: refactor this to be not annoying and repetitive
        // this is probably not getting done
        HStack(alignment: .bottom) {
            Group {
                Spacer()
                VStack(alignment: .center) {
                    Image(systemName: "storefront")
                        .font(.title2)
                    Text("Shop")
                }
                Spacer()
                VStack {
                    Image(systemName: "heart")
                        .font(.title2)
                    Text("My Items")
                }
                Spacer()
                VStack {
                    Image(systemName: "sparkle.magnifyingglass")
                        .font(.title2)
                    Text("Search")
                }
                .foregroundStyle(.blue)
                Spacer()
                VStack {
                    Image(systemName: "circle.grid.2x2")
                        .font(.title2)
                    Text("Services")
                }
                Spacer()
                VStack {
                    Image(systemName: "person.crop.circle")
                        .font(.title2)
                    Text("Account")
                }
                Spacer()
            }
        }
        .font(.subheadline)
        .foregroundStyle(.gray)
    }
}

#Preview {
    SearchView()
}

// #0c74dc
