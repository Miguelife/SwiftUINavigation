//
//  DetailedColor.swift
//  NavigationExample
//
//  Created by Miguel Ángel Soto González on 20/11/24.
//

import SwiftUI

enum DetailedColor {
    case red, blue, green, yellow, orange

    init(from color: Color) {
        switch color {
        case .red: self = .red
        case .blue: self = .blue
        case .green: self = .green
        case .yellow: self = .yellow
        case .orange: self = .orange
        default: fatalError("Unknown color \(color)")
        }
    }

    var rawValue: Color {
        switch self {
        case .red: .red
        case .blue: .blue
        case .green: .green
        case .yellow: .yellow
        case .orange: .orange
        }
    }

    var title: String {
        switch self {
        case .red: "Red"
        case .blue: "Blue"
        case .green: "Green"
        case .yellow: "Yellow"
        case .orange: "Orange"
        }
    }

    var message: String {
        switch self {
        case .red:
            "Represents passion, energy, and intensity. It is often associated with love, excitement, and urgency, but it can also symbolize danger or warning."
        case .blue:
            "Represents calmness, tranquility, and stability. It is often associated with wisdom, security, and reliability, but it can also symbolize sadness, depression, or sadness."
        case .green:
            "Represents nature, growth, and harmony. It is often associated with hope, optimism, and renewal, but it can also symbolize sadness, depression, or sadness."
        case .yellow:
            "Represents caution, cautionary, and cautionary. It is often associated with caution, danger, or warning, but it can also symbolize hope, optimism, and renewal."
        case .orange:
            "Represents energy, excitement, and intensity. It is often associated with love, excitement, and urgency, but it can also symbolize danger or warning."
        }
    }
}
