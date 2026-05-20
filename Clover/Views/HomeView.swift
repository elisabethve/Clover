//
//  HomeView.swift
//  Clover
//
//  Created by Elisabeth Everhart on 5/20/26.
//

import SwiftUI
import SwiftData

struct HomeView: View {
    @Query var clovers: [CloversFind]

    var body: some View {
        NavigationView {
            VStack {
                Text("Clover Tracker")
                    .font(.largeTitle)
                    .padding()

                // Display running totals
                VStack(alignment: .leading) {
                    Text("Running Totals:")
                        .font(.headline)
                    Text("4-leaf: \(clovers.filter { $0.leafCount == 4 }.reduce(0) { $0 + $1.quantity })")
                    Text("5-leaf: \(clovers.filter { $0.leafCount == 5 }.reduce(0) { $0 + $1.quantity })")
                    Text("6-leaf: \(clovers.filter { $0.leafCount == 6 }.reduce(0) { $0 + $1.quantity })")
                }
                .padding()

                Spacer()

                // Log a Find button
                NavigationLink(destination: LogFindView()) {
                    Text("Log a Find")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()
            }
        }
    }
}

#Preview {
    HomeView()
}