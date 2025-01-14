//
//  HomeView.swift
//  NavigationExample
//
//  Created by Miguel Ángel Soto González on 31/10/24.
//

import SwiftUI

@Observable
class Figure {
    var size: CGFloat = 100
    var color: Color = .red
    var rotationDegrees: Angle = .degrees(0)

    func randomSize() {
        let min = 10...400
        size = CGFloat(integerLiteral: .random(in: min))
    }

    func randomColor() {
        color = .init(hue: .random(in: 0...1), saturation: .random(in: 0...1), brightness: .random(in: 0...1))
    }

    func randomDegrees() {
        rotationDegrees = .degrees(.random(in: 0...360))
    }

    func randomize() {
        randomSize()
        randomColor()
        randomDegrees()
    }
}

struct ViewA: View {
    private var navigator = Navigator.shared
    @State var box = Figure()

    let uuid: UUID = .init()

    var body: some View {
        VStack(spacing: 20) {
            Text(uuid.uuidString)

            Spacer()

            box.color
                .onTapGesture {
                    withAnimation {
                        box.randomize()
                    }
                }
                .rotationEffect(box.rotationDegrees)
                .frame(width: box.size, height: box.size)

            Spacer()

            Button("Navigate to A") {
                navigator.navigate(to: ViewA())
            }

            Button("Navigate to B") {
                navigator.navigate(to: ViewB())
            }

            Button("Replace root with B") {
                navigator.replaceRoot(to: ViewB())
            }

            Spacer()
        }
    }
}
