//
//  ContentView.swift
//  Calculator
//
//  Created by english on 2024-09-23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            LinearGradient(gradient:
                            Gradient(colors: [.pink.opacity(0.4),
                                     .purple.opacity(0.5)]),
                           startPoint: .top,
                           endPoint: .bottom)
                           .ignoresSafeArea()
        }
    }
}

#Preview {
    ContentView()
}
