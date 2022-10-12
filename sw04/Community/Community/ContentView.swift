import SwiftUI


struct ContentView: View {
    
    let community = Community()
    @State var shuffleCount: Int = 0
    // writeonce here todo:
     let Many = 1_000_000
    
    var body: some View {
        
        NavigationView {
            List {
                Button(action: { self.shuffleFew() }) {
                    Text("Shuffle Few")
                }
                Button(action: { self.synchronouslyShuffleMany() })  {
                    Text("Schuffle Many Synchronized")
                }
                Button(action: { self.shuffleConcurrent() })  {
                    Text("Shuffle Concurrent")
                }
                
                Button("Shuffle Twice") {
                    
                    Task(priority: .high) {
                        await self.shuffleConcurrentAsync()
                    }
                    Task(priority: .low) {
                        await self.shuffleConcurrentAsync()
                    }
                }
                Button(action: { self.concurrentPerform() })  {
                    Text("DispatchQueue.concurrentPerform( () -> )")
                }
                
                
                Text("Initial Total: 50000")
                Text("10000 | 10000 | 10000 | 10000 | 10000")
                Text("Last Total: 50000")
                Text("\(shuffleCount) times shuffled")
            }
            .navigationBarTitle(Text("Shuffle"))
        }
    }
    
    
    
    private func shuffleConcurrentAsync() async {
    
            for _ in 0...Many {
                synchronouslyShuffleMany()
            }
        
    }

    
    private func shuffleFew() {
        for _ in 0..<10000 {
            if let lender = self.community.members.randomElement(){
                if let borrower = self.community.members.randomElement() {
                    lender.lend(borrower: borrower)
                } else {
                    print("random Element is nil wtf")
                }
            } else {
                print("random Element is nil wtf")
            }
            self.shuffleCount += 1
        }
    }
   
    private func synchronouslyShuffleMany() {
        for _ in 0..<Many {
            if let lender = self.community.members.randomElement(){
                if let borrower = self.community.members.randomElement() {
                    lender.lend(borrower: borrower)
                }
            }
            self.shuffleCount += 1
        }
    }
    
    private func shuffleConcurrent() {
        let thread = Thread {
            for _ in 0...Many {
                synchronouslyShuffleMany()
            }
        }
    }
    private func concurrentPerform() {
        var counter = 0

        DispatchQueue.concurrentPerform(iterations: 2) { _ in
         counter += 1
        }
        print(counter)
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            ContentView()
        }
    }
}

