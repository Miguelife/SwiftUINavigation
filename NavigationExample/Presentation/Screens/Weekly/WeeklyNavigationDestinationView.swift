//
//  NavigationDestination.swift
//  NavigationExample
//
//  Created by Miguel Ángel Soto González on 3/1/25.
//

import SwiftUI

struct WeeklyNavigationDestinationView: View {
    @State var isNavigatingToGreen: Bool = false

    var body: some View {
        NavigationStack {
            VStack {
                NavigationLink(value: Color.red) {
                    Text("Red")
                }

                Button("Green") {
                    isNavigatingToGreen = true
                }
            }
            .navigationDestination(for: Color.self, destination: { color in
                ColorDetailView(color: DetailedColor(from: color))
            })
            .navigationDestination(isPresented: $isNavigatingToGreen) {
                ColorDetailView(color: .green)
            }
            .navigationTitle("Weekly Destination")
        }
    }
}
