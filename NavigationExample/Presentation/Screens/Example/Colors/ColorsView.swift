import SwiftUI

struct ColorsView: View {
    @State var navigator: NavigatorProtocol
    let colors = [DetailedColor.red, DetailedColor.blue, DetailedColor.green, DetailedColor.yellow, DetailedColor.orange]
    let columns = [GridItem(.flexible(), spacing: 16), GridItem(.flexible())]

    init(navigator: NavigatorProtocol = Navigator.shared) {
        self.navigator = navigator
    }

    var body: some View {
        NavigationStack(path: $navigator.path) {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 16) {
                    ForEach(colors, id: \.self) { color in
                        Button {
                            navigator.navigate(to:
                                ColorDetailView(color: color),
                                with: .zoom(
                                    sourceID: color,
                                    in: navigator.namespace))
                        } label: {
                            color.rawValue
                                .frame(height: 250)
                                .matchedTransitionSource(id: color, in: navigator.namespace, configuration: { source in
                                    source
                                        .background(color.rawValue)
                                        .clipShape(RoundedRectangle(cornerRadius: 16))
                                        .shadow(radius: 8)
                                })
                        }
                    }
                }
                .padding(16)
            }

            .scrollIndicators(.hidden)
            .navigationTitle("Colors Grid")
            .navigationDestination(for: Page.self) { page in
                page
            }
        }
    }
}
