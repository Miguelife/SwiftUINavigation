//
//  AlertConfig.swift
//  NavigationExample
//
//  Created by Miguel Ángel Soto González on 22/11/24.
//

import SwiftUI

public struct AlertConfig {
    let title: String
    let message: String
    @ViewBuilder let actions: any View

    init(title: String, message: String, actions: @escaping () -> any View) {
        self.title = title
        self.message = message
        self.actions = actions()
    }
}
