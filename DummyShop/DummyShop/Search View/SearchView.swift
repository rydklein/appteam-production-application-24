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
            HStack (alignment: .center) {
                ZStack {
                    Circle()
                        .fill(.cyan)
                        .frame(width: 20, height: 20)
                    Image(systemName: "truck.box")
                        .font(.system(size: 10))
                }
                Group {
                    Text("How do you want your items?")
                    Text("|")
                        .fontWeight(.light)
                    Text("27514")
                }
                .foregroundStyle(.background)
                Spacer()
                Image(systemName: "chevron.down")
                    .foregroundStyle(.background)
            }
        }
        .padding()
        .background(Color.blue)
    }
}

#Preview {
    SearchView()
}

// #0c74dc
