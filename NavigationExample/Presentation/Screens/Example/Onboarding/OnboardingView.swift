//
//  LoginView.swift
//  NavigationExample
//
//  Created by Miguel Ángel Soto González on 20/11/24.
//

import SwiftUI

struct OnboardingView: View {
    var navigator: NavigatorProtocol

    init(navigator: NavigatorProtocol = Navigator.shared) {
        self.navigator = navigator
    }

    // MARK: - BODY
    var body: some View {
        NavigationStack {
            ZStack {
                Color.indigo

                VStack(spacing: 0) {
                    VStack(alignment: .leading) {
                        Text("Welcome to Navigation Example")
                            .font(.title)
                            .fontWeight(.bold)

                        HStack { Spacer() }

                        Text("Discover SwiftUI Navigation")
                            .font(.headline)
                    }
                    .padding()
                    .foregroundStyle(.indigo)
                    .background(.white)
                    .clipShape(.rect(cornerRadius: 16))
                    .padding()

                    Button {
                        navigator.replaceRoot(to: TabBarView())
                    } label: {
                        HStack {
                            Text("Get Started")
                                .font(.title3)
                                .fontWeight(.bold)
                            Spacer()
                            Image(systemName: "chevron.right")
                        }
                        .foregroundStyle(.indigo)
                        .padding()
                        .background(.white)
                        .clipShape(.buttonBorder)
                    }
                    .padding()
                }
            }
            .ignoresSafeArea()
        }
    }
}
