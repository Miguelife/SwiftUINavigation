//
//  TabBarView.swift
//  NavigationExample
//
//  Created by Miguel Ángel Soto González on 20/11/24.
//

import SwiftUI

struct TabBarView: View {
    @State var navigator = Navigator.shared

    var body: some View {
        TabView {
            AppInfoView()
                .tabItem { Image(systemName: "info.circle") }

            ColorListView()
                .tabItem { Image(systemName: "list.bullet") }

            ColorsView()
                .tabItem { Image(systemName: "square.grid.2x2") }
        }
    }
}
