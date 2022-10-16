import SwiftUI


struct ContentView: View {
    
    @StateObject var community = Community()
    
    var body: some View {
        TabView {
            BasicView()
                .tabItem{
                    Label("BasicView",systemImage: "square.and.pencil")
                }
            SafeView()
                .tabItem{
                    Label("SafeView", systemImage: "list.dash")
                }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            ContentView()
        }
    }
}

