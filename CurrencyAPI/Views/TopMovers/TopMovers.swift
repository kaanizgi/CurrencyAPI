//
//  TopMovers.swift
//  design
//
//  Created by Kaan İzgi on 30.08.2022.
//

import SwiftUI

struct TopMovers: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Top Movers")
                .font(.headline)
            ScrollView(.horizontal,showsIndicators: false) {
                HStack(spacing:12) {
                    ForEach(0 ..< 5) { item in
                        TopMoversItem()
                    }
                }
            }
        }.padding()
    }
}

struct TopMovers_Previews: PreviewProvider {
    static var previews: some View {
        TopMovers()
    }
}
