import SwiftUI


struct ContentView: View {
    let community = Community()
    @State var shuffleCount: Int = 0
    
    var body: some View {
        
        NavigationView {
            List {
                Button(action: { self.shuffleFew() }) {
                    Text("Shuffle Few")
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
                Text("Last Total: 50000")
                Text("\(shuffleCount) times shuffled")
                
            }
            .navigationBarTitle(Text("Shuffle 🔀"))
        }
    }

    
    private func shuffleFew() {
        for _ in 0..<50000 {
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
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            ContentView()
        }
    }
}

