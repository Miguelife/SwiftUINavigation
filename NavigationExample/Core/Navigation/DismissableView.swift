//
//  DismissableView.swift
//  NavigationExample
//
//  Created by Miguel Ángel Soto González on 20/11/24.
//

import SwiftUI

struct DismissableView<Content: View>: View {
    @Environment(\.dismiss) private var dismiss
    private var content: () -> Content

    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }

    var body: some View {
        ZStack(alignment: .topLeading) {
            content()
            dismissButton
        }
        .ignoresSafeArea()
        .statusBarHidden()
        .navigationBarBackButtonHidden()
    }

    var dismissButton: some View {
        HStack {
            Spacer()
            Button {
                dismiss()
            } label: {
                Image(systemName: "xmark")
                    .frame(width: 30, height: 30)
                    .foregroundColor(Color(uiColor: .label))
                    .background(Color(uiColor: .systemBackground))
                    .clipShape(Circle())
            }
            .padding([.top, .trailing], 30)
        }
    }
}
