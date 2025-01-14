//
//  Navigator.swift
//  NavigationExample
//
//  Created by Miguel Ángel Soto González on 1/11/24.
//

import SwiftUI

@Observable
class Navigator: NavigatorProtocol {
    // MARK: - Properties
    var path = [Page]()
    var namespace: Namespace.ID!
    private(set) var root: Page?
    var sheet: Page?
    var alertConfig: AlertConfig?
    var isPresentingAlert = false {
        didSet {
            if isPresentingAlert == false {
                alertConfig = nil
            }
        }
    }

    // MARK: - Init
    static var shared = Navigator()
    private init() {}

    // MARK: - Methods
    func initialize(root view: any View, namespace: Namespace.ID) {
        root = Page(from: view)
        self.namespace = namespace
    }

    func navigate(to view: any View) {
        path.append(Page(from: view, with: .automatic))
    }

    func navigate(to view: any View, with transition: NavigationTransition) {
        path.append(Page(from: view, with: transition))
    }

    func dismiss() {
        path.removeLast()
    }

    func dismissAll() {
        path.removeAll()
    }

    func replaceRoot(to view: any View) {
        root = Page(from: view)
        path.removeAll()
    }

    func present(view: any View) {
        sheet = Page(from: view)
    }

    func showAlert(from config: AlertConfig) {
        alertConfig = config
        isPresentingAlert = true
    }
}
