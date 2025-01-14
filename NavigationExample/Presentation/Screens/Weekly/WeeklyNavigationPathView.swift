//
//  WeeklyNavigationPath.swift
//  NavigationExample
//
//  Created by Miguel Ángel Soto González on 3/1/25.
//

import SwiftUI

enum WeeklyPage: Hashable {
    case detail
    case color(DetailedColor)
}

@Observable
class WeeklyNavigator {
    var path = NavigationPath()
}

struct WeeklyNavigationPathView: View {
    @State var navigator = WeeklyNavigator()

    // MARK: - BODY
    var body: some View {
        NavigationStack(path: $navigator.path) {
            VStack {
                Button("Navigate to Detail") {
                    navigator.path.append(WeeklyPage.detail)
                }
            }
            .navigationDestination(for: Page.self, destination: { view in
                view
            })


            .navigationTitle("Weekly Path")
        }
        .environment(navigator)
    }
}

struct WeeklyNavigationPathDetailView: View {
    @Environment(WeeklyNavigator.self) var navigator

    // MARK: - BODY
    var body: some View {
        Button("Navigate to ColorDetailed View") {
            navigator.path.append(WeeklyPage.color(.yellow))
        }
        .navigationTitle("Weekly Path Detail")
    }
}
