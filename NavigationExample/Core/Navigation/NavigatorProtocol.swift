//
//  NavigatorProtocol.swift
//  NavigationExample
//
//  Created by Miguel Ángel Soto González on 7/1/25.
//

import SwiftUI

protocol NavigatorProtocol {
    // MARK: - Properties
    var path: [Page] { get set }
    var namespace: Namespace.ID! { get }
    var root: Page? { get }
    var sheet: Page? { get set }
    var alertConfig: AlertConfig? { get }
    var isPresentingAlert: Bool { get set }

    // MARK: - Methods
    func initialize(root view: any View, namespace: Namespace.ID)

    func navigate(to view: any View, with transition: NavigationTransition)

    func navigate(to view: any View)

    func dismiss()

    func dismissAll()

    func replaceRoot(to view: any View)

    func present(view: any View)

    func showAlert(from config: AlertConfig)
}
