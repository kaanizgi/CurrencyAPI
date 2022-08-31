//
//  DetailView.swift
//  design
//
//  Created by Kaan İzgi on 30.08.2022.
//

import SwiftUI

struct DetailView: View {
    var name:String
    var body: some View {
        Text(name)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(name: "kaanki")
    }
}
