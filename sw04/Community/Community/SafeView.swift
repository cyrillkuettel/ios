import SwiftUI

    
struct SafeView: View {
    
    @StateObject var community = Community2()
    
    
    var body: some View {
        
        List {
            
            Button("Shuffle Concurrent (Task)") {
                Task {
                    await self.community.shuffleConcurrent()
                }
            }
             
            
            Button("Shuffle Twice") {
                Task(priority: .high) {
                    await self.community.shuffleConcurrent()
                }
                Task(priority: .low) {
                    await self.community.shuffleConcurrent()
                }
            }
            
            
            let initialSum = community.members.map({$0.getCapital()}).reduce(0, +)

            Text("Initial Total: \(initialSum)")
            Text("\(community.members[0].getCapital()) | \(community.members[1].getCapital()) | \(community.members[2].getCapital()) | \(community.members[3].getCapital()) | \(community.members[4].getCapital())")
            Text("Last Total: \(community.lastTotal)")
             
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

