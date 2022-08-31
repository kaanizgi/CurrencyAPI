//
//  ContentView.swift
//  design
//
//  Created by Kaan İzgi on 29.08.2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var vm = MainViewModel()
    var body: some View {
        NavigationView {
            ScrollView(.vertical,showsIndicators: false) {
                TopMovers()
                Divider().padding(.leading).padding(.trailing)
                CoinRowView()
            }.navigationTitle("Live Prices")
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
