//
//  WeeklyNavigationLink.swift
//  NavigationExample
//
//  Created by Miguel Ángel Soto González on 3/1/25.
//

import SwiftUI

struct WeeklyNavigationLinkView: View {
    let colors: [DetailedColor] = [.red, .yellow, .green, .blue, .orange]

    var body: some View {
        NavigationStack {
            List {
                ForEach(colors, id: \.rawValue) { color in
                    NavigationLink(color.title) {
                        ColorDetailView(color: color)
                    }
                }
            }
            .navigationTitle("Weekly Link")
        }
    }
}
