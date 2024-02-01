//
//  ProductView.swift
//  DummyShop
//
//  Created by Ryder Klein on 1/31/24.
//

import SwiftUI

struct ProductView: View {
    var product: Product
    var geo: GeometryProxy
    var body: some View {
        HStack(spacing: .zero) {
            AsyncImage(url: URL(string: product.thumbnail)) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .clipShape(.rect(cornerRadius: 25))
            } placeholder: {
                ProgressView()
            }
            // 2/5ths of screen space (looks about right)
            .frame(width: (geo.size.width / 5) * 2)
            .clipped()
            .clipShape(.rect(cornerRadius: 25))
            .padding(.trailing)
            // I don't know what this does but the list row seperator disappears without it
            .alignmentGuide(.listRowSeparatorLeading) { _ in 0 }
            Spacer()
            VStack(alignment: .leading, spacing: 6) {
                Group {
                    if product.discountPercentage > 0 {
                        HStack(alignment: .firstTextBaseline) {
                            Text("Now $\((product.price) * (1 - (product.discountPercentage / 100)), specifier: "%0.2f")")
                                .foregroundStyle(.green)
                                .bold()
                            Text("$\(product.price, specifier: "%0.2f")")
                                .foregroundStyle(.secondary)
                                .font(.footnote)
                                .strikethrough()
                        }
                    } else {
                        Text("$\(product.price / 100, specifier: "%0.2f")")
                            .bold()
                    }
                }
                Text(product.title)
                    .multilineTextAlignment(.leading)
                // This is a bad way to do this but i've had like three hours total free time to work on this during the week so we ball
                HStack(spacing: .zero) {
                    Image(systemName: "star.fill")
                        .foregroundStyle(round(product.rating) > 0 ? .yellow : .secondary)
                    Image(systemName: "star.fill")
                        .foregroundStyle(round(product.rating) > 1 ? .yellow : .secondary)
                    Image(systemName: "star.fill")
                        .foregroundStyle(round(product.rating) > 2 ? .yellow : .secondary)
                    Image(systemName: "star.fill")
                        .foregroundStyle(round(product.rating) > 3 ? .yellow : .secondary)
                    Image(systemName: "star.fill")
                        .foregroundStyle(round(product.rating) > 4 ? .yellow : .secondary)
                }
                HStack {
                    (Text("Free shipping, arrives ") + Text("in 2 days").bold())
                        .font(.footnote)
                }
                ZStack {
                    Capsule()
                        .fill(.blue)
                        .frame(height: 40)
                    Text("Add to cart")
                        .foregroundStyle(.white)
                }
                .onTapGesture {
                    // nada
                }
            }
            Spacer()
        }.padding([.top, .bottom])
    }
}

#Preview {
    SearchView()
}
