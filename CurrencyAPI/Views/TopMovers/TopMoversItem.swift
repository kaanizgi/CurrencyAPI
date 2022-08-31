//
//  TopMoversItem.swift
//  design
//
//  Created by Kaan İzgi on 30.08.2022.
//

import SwiftUI

struct TopMoversItem: View {
    var body: some View {
        VStack(alignment:.leading) {
            Image(systemName: "bitcoinsign.circle.fill").resizable()
                .frame(width: 32, height: 32)
                .foregroundColor(.orange)
                .padding(.bottom,8)
            HStack(spacing:2) {
                Text("BTC")
                    .font(.caption)
                    .bold()
                Text("$20,330.00")
                    .font(.caption)
                    .foregroundColor(.gray)
                
            }
            Text("+ 5.60%")
                .font(.title2).foregroundColor(.green)
        }.frame(width: 140, height: 140).overlay(
        RoundedRectangle(cornerRadius: 10)
            .stroke(Color(.systemGray4),lineWidth: 1)
        )
    }
}

struct TopMoversItem_Previews: PreviewProvider {
    static var previews: some View {
        TopMoversItem()
    }
}
