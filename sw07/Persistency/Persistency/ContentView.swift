import SwiftUI

struct ContentView: View {
    
    
    var body: some View {
        TabView {
            EditView()
                .tabItem{
                    Label("EditView",systemImage: "person.fill.badge.plus")
                }
            ChartView()
                .tabItem{
                    Label("ChartView", systemImage: "chart.bar.doc.horizontal")
                }
        }
    }
    
}
