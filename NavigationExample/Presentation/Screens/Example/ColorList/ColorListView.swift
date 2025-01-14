//
//  ColorList.swift
//  NavigationExample
//
//  Created by Miguel Ángel Soto González on 20/11/24.
//

import SwiftUI

struct ColorListView: View {
    @State var navigator: NavigatorProtocol
    let colors: [DetailedColor] = [.red, .blue, .green, .yellow, .orange]

    init(navigator: NavigatorProtocol = Navigator.shared) {
        self.navigator = navigator
    }

    var body: some View {
        NavigationStack(path: $navigator.path) {
            List {
                ForEach(colors, id: \.self) { color in
                    Button {
                        navigator.navigate(to: ColorDetailView(color: color))
                    } label: {
                        Text(color.title)
                    }
                }
            }
            .navigationTitle("Colors List")
            .navigationDestination(for: Page.self) { page in
                page
            }
        }
    }
}
