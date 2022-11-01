import SwiftUI

struct ContentView: View {
    
    
    var body: some View {
        TabView {
            EditView()
                .tabItem{
                    Label("EditView",systemImage: "square.and.pencil")
                }
            ChartView()
                .tabItem{
                    Label("ChartView", systemImage: "list.dash")
                }
        }
    }
    
}
