import SwiftUI

public enum ContentTab: String, Hashable {
    case welcome, home, settings
}

public struct ContentView: View {
    @AppStorage("tab") var tab = ContentTab.welcome
    @State var viewModel = ViewModel()
    @State var appearance = ""
    @State var isBeating = false

    public init() {
    }

    public var body: some View {
            
            NavigationStack {
                List {
                    ForEach(viewModel.items) { item in
                        NavigationLink(value: item) {
                            Label {
                                Text(item.itemTitle)
                            } icon: {
                                if item.favorite {
                                    Image(systemName: "star.fill")
                                        .foregroundStyle(.yellow)
                                }
                            }
                        }
                    }
                    .onDelete { offsets in
                        viewModel.items.remove(atOffsets: offsets)
                    }
                    .onMove { fromOffsets, toOffset in
                        viewModel.items.move(fromOffsets: fromOffsets, toOffset: toOffset)
                    }
                }
                .navigationTitle(Text("\(viewModel.items.count) Items"))
                .navigationDestination(for: Item.self) { item in
                    ItemView(item: item, viewModel: $viewModel)
                        .navigationTitle(item.itemTitle)
                }
                .toolbar {
                    ToolbarItemGroup {
                        Button {
                            withAnimation {
                                viewModel.items.insert(Item(), at: 0)
                            }
                        } label: {
                            Label("Add", systemImage: "plus")
                        }
                    }
                }
            }
            .tabItem { Label("Home", systemImage: "house.fill") }
            .tag(ContentTab.home)
        }

    
}

