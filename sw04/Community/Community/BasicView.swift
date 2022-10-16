import SwiftUI


struct BasicView: View {
    
    @StateObject var community = Community()
    
    var body: some View {
        
        List {
            Button(action: { community.shuffleFew() }) {
                Text("Shuffle Few")
            }
            Button(action: { community.shuffleManySynchronized() })  {
                Text("Schuffle Many Synchronized")
            }
            Button(action: { community.shuffleInTask() })  {
                Text("Shuffle Concurrent (Task)")
            }
            
            Button("Shuffle Twice") {
                
                Task(priority: .high) {
                    await community.shuffleConcurrent()
                }
                Task(priority: .low) {
                    await community.shuffleConcurrent()
                }
            }
            
            
            Text("Initial Total: \(community.initialTotal)")
            Text("\(community.members[0].capital) | \(community.members[1].capital) | \(community.members[2].capital) | \(community.members[3].capital) | \(community.members[4].capital)")
            Text("Last Total: \(community.lastTotal)")
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


