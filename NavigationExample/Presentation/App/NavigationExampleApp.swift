//
//  NavigationExampleApp.swift
//  NavigationExample
//
//  Created by Miguel Ángel Soto González on 31/10/24.
//

import SwiftUI

@main
struct NavigationExampleApp: App {
    @Namespace var namespace

    var body: some Scene {
        WindowGroup {
            // WeeklyNavigationLinkView()
            // WeeklyNavigationDestinationView()
            // WeeklyNavigationPathView()
            ContentView(root: OnboardingView(), namespace: namespace)
        }
    }
}
