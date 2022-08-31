//
//  MainViewModel.swift
//  design
//
//  Created by Kaan İzgi on 30.08.2022.
//

import Foundation
import Combine

class MainViewModel:ObservableObject {
    
    @Published var coinList = [Coins]()
    let webService = APIService()
    var cancellable = Set<AnyCancellable>()
    @Published var per = 20
    @Published var page = 0
    
    
    init() {
        getCoins()
    }
    
    
    func getCoins() {
        let url = URL(string: "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=\(per)&page=\(page)&sparkline=true&price_change_percentage=24h")!
        webService.fetch(url: url, expecting: [Coins].self)
            .receive(on: DispatchQueue.main)
            .sink { completion in
                print(completion)
            } receiveValue: { coins in
                self.coinList.append(contentsOf: coins)
            }
            .store(in: &cancellable)
    }
}
