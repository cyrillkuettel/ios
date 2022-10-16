
import Foundation

class Community : ObservableObject{

//  let members: [Member] = Array(repeating:  Member(), count: 5)
    
    let members: [Member] = [Member(), Member(), Member(), Member(), Member()]
    let Many = 1_000_000
    let Few = 1000
    
    @Published var shuffleCount: Int = 0

    public func shuffleConcurrentAsync() async {
        for _ in 0...Many {
            synchronouslyShuffleMany()
        }
    }

    
    public func shuffleFew() {
        for _ in 0..<self.Few {
            if let lender = self.members.randomElement(){
                if let borrower = self.members.randomElement() {
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
   
    public func shuffleConcurrent() {
        let thread = Thread {
            for _ in 0...self.Many {
                self.synchronouslyShuffleMany()
            }
        }
    }
    public func synchronouslyShuffleMany() {
        for _ in 0..<self.Many {
            if let lender = self.members.randomElement(){
                if let borrower = self.members.randomElement() {
                    lender.lend(borrower: borrower)
                }
            }
            self.shuffleCount += 1
        }
    }
}
