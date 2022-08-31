//
//  CoinRowDetaik.swift
//  design
//
//  Created by Kaan İzgi on 30.08.2022.
//

import SwiftUI

struct CoinRowDetail: View {
    let coin:Coins
    var body: some View {
        HStack {
            Text("\(coin.marketCapRank ?? 1)")
                .font(.caption).foregroundColor(.gray)
            AsyncImage(
                url:URL(string: coin.image),
                content: { image in
                    image.resizable()
                        .frame(maxWidth: 32, maxHeight: 32)
                },
                placeholder: {
                    ProgressView()
                }
            )
            
            VStack(alignment: .leading, spacing: 4) {
                Text("\(coin.name)").font(.subheadline).fontWeight(.semibold).padding(.leading,4)
                Text("\(coin.symbol)").font(.caption).padding(.leading,6)
            }
            Spacer()
            VStack(alignment: .trailing,spacing: 4) {
                Text("\(coin.currentPrice.toCurrency())")
                    .font(.subheadline).fontWeight(.semibold).padding(.leading,4)
                Text("\(coin.priceChange24H.toCurrency())")
                    .font(.caption)
                    .padding(.leading,6).foregroundColor(.red)
            }
        }.padding(.horizontal).padding(.vertical,4)
        
    }
}

/*
 struct CoinRowDetaik_Previews: PreviewProvider {
 static var previews: some View {
 CoinRowDetail()
 }
 }
 */
