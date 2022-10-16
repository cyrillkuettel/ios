import SwiftUI


struct SafeView: View {
    
    @StateObject var community = Community()
    
    
    var body: some View {
        
        List {
            
            Button(action: { self.community.shuffleInTask() })  {
                Text("Shuffle Concurrent (Task)")
            }
            
            Button("Shuffle Twice") {
                Task(priority: .high) {
                    await self.community.shuffleConcurrent()
                }
                Task(priority: .low) {
                    await self.community.shuffleConcurrent()
                }
            }
            
            let initialSum = community.members.map({$0.capital}).reduce(0, +)
            
            Text("Initial Total: \(initialSum)")
            Text("\(community.members[0].capital) | \(community.members[1].capital) | \(community.members[2].capital) | \(community.members[3].capital) | \(community.members[4].capital)")
            Text("Last Total: \(community.totalSum)")
            Text("\(community.shuffleCount) times shuffled")
        }
    }
    
}

struct SafeView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            SafeView()
        }
    }
}

