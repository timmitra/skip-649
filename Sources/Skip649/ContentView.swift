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
            
        PostListView()
        
    }

    
}

