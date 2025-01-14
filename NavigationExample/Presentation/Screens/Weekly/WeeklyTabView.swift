//
//  WeeklyTabView.swift
//  NavigationExample
//
//  Created by Miguel Ángel Soto González on 3/1/25.
//

import SwiftUI

struct WeeklyTabView: View {
    // MARK: - BODY
    var body: some View {
        TabView {
            WeeklyNavigationLinkView()
                .tabItem { Image(systemName: "link") }
            WeeklyNavigationDestinationView()
                .tabItem { Image(systemName: "arrow.triangle.branch") }
            WeeklyNavigationPathView()
                .tabItem { Image(systemName: "point.topleft.filled.down.to.point.bottomright.curvepath") }
        }
    }
}
