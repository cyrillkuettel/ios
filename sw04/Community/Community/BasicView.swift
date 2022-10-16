import SwiftUI


struct BasicView: View {
    
    @StateObject var community = Community()
    
    
    var body: some View {
        
        List {
            Button(action: { self.community.shuffleFew() }) {
                Text("Shuffle Few")
            }
            Button(action: { self.community.synchronouslyShuffleMany() })  {
                Text("Schuffle Many Synchronized")
            }
            Button(action: { self.community.shuffleConcurrent() })  {
                Text("Shuffle Concurrent (Task)")
            }
            
            Button("Shuffle Twice") {
                
                Task(priority: .high) {
                    await self.community.shuffleConcurrentAsync()
                }
                Task(priority: .low) {
                    await self.community.shuffleConcurrentAsync()
                }
            }
            
            let initialSum = community.members.map({$0.capital}).reduce(0, +)
            
            Text("Initial Total: \(initialSum)")
            Text("\(community.members[0].capital) | \(community.members[1].capital) | \(community.members[2].capital) | \(community.members[3].capital) | \(community.members[4].capital)")
            Text("Last Total: \(community.totalSum)")
            Text("\(community.shuffleCount) times shuffled")
        }
        .navigationBarTitle(Text("Shuffle"))
    }
}

struct BasicView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            BasicView()
        }
    }
}


