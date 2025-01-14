//
//  AppDetailView.swift
//  NavigationExample
//
//  Created by Miguel Ángel Soto González on 20/11/24.
//

import SwiftUI

struct AppInfoView: View {
    @State var navigator: NavigatorProtocol

    init(navigator: NavigatorProtocol = Navigator.shared) {
        self.navigator = navigator
    }

    // MARK: - BODY
    var body: some View {
        NavigationStack(path: $navigator.path) {
            ScrollView {
                Text("App made by Miguel Ángel Soto González")

                customButton(title: "Show Onboarding") {
                    navigator.replaceRoot(to: OnboardingView())
                }

                customButton(title: "Show Sheet") {
                    navigator.present(view: ColorDetailView(color: .red))
                }

                customButton(title: "Show Alert") {
                    navigator.showAlert(from:
                        AlertConfig(
                            title: "Title",
                            message: "Message",
                            actions: {
                                VStack {
                                    Button("Ok", role: .destructive) {}
                                    Button("Cancel", role: .cancel) {}
                                }
                            }
                        )
                    )
                }
            }
            .padding(.horizontal)
            .navigationTitle("App Info")
            .navigationDestination(for: Page.self) { page in
                page
            }
        }
    }

    @ViewBuilder
    func customButton(title: String, action: @escaping () -> Void) -> some View {
        Button {
            action()
        } label: {
            HStack {
                Text(title)
                    .bold()
                Spacer()
                Image(systemName: "chevron.right")
            }
            .padding()
        }
        .buttonStyle(.borderedProminent)
    }
}
