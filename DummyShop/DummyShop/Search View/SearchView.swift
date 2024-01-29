//
//  SearchView.swift
//  DummyShop
//
//  Created by Ryder Klein on 1/29/24.
//

import Foundation

import SwiftUI

struct SearchView: View {
    @State var text = ""
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
                        TextField(text: $text) {
                            Text("Search")
                        }
                        Image(systemName: "barcode.viewfinder")
                    }
                    .padding([.leading, .trailing])
                }
                .frame(width: .infinity, height: 30)
                ZStack(alignment: .topTrailing) {
                    Image(systemName: "cart")
                        .font(.title2)
                        .foregroundStyle(.background)
                    VStack(alignment: .trailing) {
                        ZStack {
                            Circle()
                                .stroke(.black)
                                .fill(.yellow)
                            Text("0")
                                .font(.system(size: 10))
                                .foregroundStyle(.black)
                        }.frame(width: 12, height: 12)
                    }
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
        EmptyView()
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
