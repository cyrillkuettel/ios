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
                
                var totalSum = self.community.members.map({$0.capital}).reduce(0, +)

                Text("Initial Total: \(totalSum)")
                Text("\(community.members[0].capital) | \(community.members[1].capital) | \(community.members[2].capital) | \(community.members[3].capital) | \(community.members[4].capital)")
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

