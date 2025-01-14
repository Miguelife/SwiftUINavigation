//
//  HomeView.swift
//  NavigationExample
//
//  Created by Miguel Ángel Soto González on 31/10/24.
//

import SwiftUI

struct ViewB: View {
    private var navigator = Navigator.shared

    let uuid: UUID = .init()

    var body: some View {
        VStack(spacing: 20) {
            HStack {
                Spacer()
                Text(uuid.uuidString)
                Spacer()
            }

            Spacer()

            Button("Navigate to A") {
                navigator.navigate(to: ViewA())
            }

            Button("Navigate to B") {
                navigator.navigate(to: ViewB())
            }

            Button("Replace root with A") {
                navigator.replaceRoot(to: ViewA())
            }

            Spacer()
        }
        .foregroundStyle(.white)
        .background(Color.indigo)
    }
}
