//
//  ColorDetail.swift
//  NavigationExample
//
//  Created by Miguel Ángel Soto González on 20/11/24.
//

import SwiftUI

struct ColorDetailView: View {
    private var color: DetailedColor

    init(color: DetailedColor) {
        self.color = color
        print("INIZIALIZING ColorDetailView - \(color.title)")
    }

    var body: some View {
        ZStack {
            color.rawValue

            VStack(alignment: .leading) {
                Spacer()
                Text(color.title)
                    .fontWeight(.bold)
                    .font(.title)
                Text(color.message)
                    .font(.title2)
                Spacer()
            }
            .padding()
            .foregroundStyle(.white)
            .ignoresSafeArea()
        }
        .ignoresSafeArea()
        .toolbarVisibility(.hidden, for: .tabBar)
    }
}
