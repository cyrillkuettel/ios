import SwiftUI


struct ContentView: View {
    
    @StateObject var community = Community()
    

    var body: some View {
        
        NavigationView {
            List {
                Button(action: { self.community.shuffleFew() }) {
                    Text("Shuffle Few")
                }
                Button(action: { self.community.synchronouslyShuffleMany() })  {
                    Text("Schuffle Many Synchronized")
                }
                Button(action: { self.community.shuffleConcurrent() })  {
                    Text("Shuffle Concurrent (Thread)")
                }
                
                Button("Shuffle Twice") {
                    
                    Task(priority: .high) {
                        await self.community.shuffleConcurrentAsync()
                    }
                    Task(priority: .low) {
                        await self.community.shuffleConcurrentAsync()
                    }
                }
                
                Text("Initial Total: 50000")
                Text("10000 | 10000 | 10000 | 10000 | 10000")
                Text("Last Total: 50000")
                Text("\(community.shuffleCount) times shuffled")
            }
            .navigationBarTitle(Text("Shuffle"))
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

