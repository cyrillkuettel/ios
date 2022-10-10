import SwiftUI


struct ContentView: View {
    let community = Community()
    
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
                Text("0 Times shuffled")
                
            }
            .navigationBarTitle(Text("Shuffle 🔀"))
        }
    }
    
    private func shuffleFew() {
        for _ in 0..<10 {
            let lender = community.members.randomElement()
            let borrower = community.members.randomElement()!
            lender?.lend(borrower: borrower)
            
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