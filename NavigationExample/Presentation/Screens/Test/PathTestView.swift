//
//  PathTestView.swift
//  NavigationExample
//
//  Created by Miguel Ángel Soto González on 3/1/25.
//

import SwiftUI

@Observable
class PathTestRouter {
    var path = [DetailedColor]()
}

struct PathTestView: View {
    @State var navigator = PathTestRouter()

    // MARK: - BODY
    var body: some View {
        PathTestTabView()
            .navigationTitle(Text("Path Test"))
            .navigationDestination(for: DetailedColor.self) { color in
                ColorDetailView(color: color)
            }
    }
}

struct PathTestTabView: View {
    // MARK: - BODY
    var body: some View {
        TabView {
            Tab("Subview 1", systemImage: "house") {
                PathTestSubView(color: .red)
            }

            Tab("Subview 2", systemImage: "list.bullet") {
                PathTestSubView(color: .blue)
            }
        }
    }
}

struct PathTestSubView: View {
    @State var isTabBarHidden = false
    @State var navigator = PathTestRouter()
    let color: DetailedColor

    // MARK: - BODY
    var body: some View {
        NavigationStack(path: $navigator.path) {
            VStack {
                color.rawValue.frame(width: 100, height: 100)
                    .onTapGesture {
                        navigator.path.append(color)
                    }
            }
            .navigationTitle(color.title)
            .navigationDestination(for: DetailedColor.self) { color in
                ColorDetailView(color: color)
                    .onAppear {
                        isTabBarHidden = true
                    }
            }
            .onAppear {
                isTabBarHidden = false
            }
        }
        .toolbar(isTabBarHidden ? .hidden : .visible, for: .tabBar)
    }
}
