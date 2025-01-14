//
//  Route.swift
//  NavigationExample
//
//  Created by Miguel Ángel Soto González on 5/11/24.
//

import SwiftUI

struct Page: View, Equatable, Hashable, Identifiable {
    let id: UUID = .init()
    private let view: AnyView

    var body: some View {
        view
    }

    init(from view: any View, with transition: NavigationTransition = .automatic) {
        self.view = transition is AutomaticNavigationTransition
            ? AnyView(view)
            : AnyView(
                DismissableView {
                    AnyView(view)
                }
                .navigationTransition(transition)
            )
    }

    nonisolated func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    nonisolated static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.id == rhs.id
    }
}
