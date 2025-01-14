//
//  ContentView.swift
//  NavigationExample
//
//  Created by Miguel Ángel Soto González on 8/11/24.
//

import SwiftUI

struct ContentView: View {
    @State var navigator: NavigatorProtocol
    let rootTransition: AnyTransition = .opacity

    public init(navigator: NavigatorProtocol = Navigator.shared, root: any View, namespace: Namespace.ID) {
        self.navigator = navigator
        navigator.initialize(root: root, namespace: namespace)
    }

    public var body: some View {
        ZStack {
            if let root = navigator.root {
                root
                    .transition(rootTransition)
            }
        }
        .animation(.default, value: navigator.root)
        .sheet(item: $navigator.sheet) { page in
            page
        }
        .alert(navigator.alertConfig?.title ?? "",
               isPresented: $navigator.isPresentingAlert)
        {
            if navigator.alertConfig != nil {
                AnyView(navigator.alertConfig!.actions)
            }
        } message: {
            Text(navigator.alertConfig?.message ?? "")
        }
    }
}
