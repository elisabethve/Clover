//
//  ContentView.swift
//  Clover
//
//  Created by Elisabeth Everhart on 5/20/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            Button(action: {
                print("Button clicked")
            }) {
                Text("Click me")
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
