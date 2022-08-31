//
//  CoinRowView.swift
//  design
//
//  Created by Kaan İzgi on 30.08.2022.
//

import SwiftUI

struct CoinRowView: View {
    @ObservedObject private var vm = MainViewModel()
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("All Coins").font(.headline).padding()
            HStack {
                Text("Coin")
                Spacer()
                Text("Prices").padding(.leading)
            }.font(.caption)
                .foregroundColor(.gray).padding(.horizontal)
            
            ScrollView(.vertical,showsIndicators: false) {
                VStack {
                    ForEach(vm.coinList) { data in
                        NavigationLink(destination: DetailView(name: data.name)) {
                            CoinRowDetail(coin: data)
                            
                        }.buttonStyle(.plain)
                    }
                }

                if vm.per == vm.coinList.count && vm.page > 4 {
                    ProgressView("Loading").onAppear {
                        vm.getCoins()
                    }
                }else {
                    GeometryReader {reader -> Color in
                        
                        let minY = reader.frame(in: .global).minY
                        let height = UIScreen.main.bounds.height / 1.3
                        
                        if minY < height {
                            print("last")
                            DispatchQueue.main.async {
                                vm.per = vm.coinList.count
                                vm.page+=1
                            }
                        }
                        
                        return Color.clear
                    }.frame(width: 20, height: 20)
                }
            }
        }.background(.regularMaterial)
            .cornerRadius(16).padding()
    }
}

struct CoinRowView_Previews: PreviewProvider {
    static var previews: some View {
        CoinRowView()
    }
}
