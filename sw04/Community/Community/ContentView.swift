import SwiftUI


struct ContentView: View {
    
    var body: some View {
        NavigationView {
            List {
                Button {
                    print("Schuffle Few")
                } label: {
                    Text("Schuffle Few")
                }
                Button {
                    print("Schuffle Many")
                } label: {
                    Text("Schuffle Many")
                }
                Button {
                    print("Shuffle Concurrent")
                } label: {
                    Text("Shuffle Concurrent")
                }
                Text("Initial Total: 50000")
                Text("10000 | 10000 | 10000 | 10000 | 10000")
                Text("Letztes Total: 50000")
                Text("0 Times shuffled")
                
            }
            .navigationBarTitle(Text("Shuffle 🔀"))
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
