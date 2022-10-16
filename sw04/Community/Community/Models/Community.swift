
import Foundation

class Community : ObservableObject{

//  let members: [Member] = Array(repeating:  Member(), count: 5)
    
    @Published var members: [Member]
    let Many = 100_000
    let Few = 1_000
    
    @Published var lastTotal: Int = 0
    
    @Published var initialTotal: Int = 0
    
    @Published var shuffleCount: Int = 0
    
    init() {
        self.members = [Member(), Member(), Member(), Member(), Member()]
        self.lastTotal = self.members.map({$0.capital}).reduce(0, +)
        self.initialTotal = self.members.map({$0.capital}).reduce(0, +)

    }
    
    
    public func updateTotal() {
        DispatchQueue.main.async{
            self.lastTotal = self.members.map({$0.capital}).reduce(0, +)
        }
    }
    
    
    public func shuffleConcurrent() async {
        await shuffleMany()
    }

    
    public func shuffleFew() {
        for _ in 0..<self.Few {
            if let lender = self.members.randomElement(){
                if let borrower = self.members.randomElement() {
                    lender.lend(borrower: borrower)
                }
            }
            self.shuffleCount += 1
        }
        self.updateTotal()
    }
   
    public func shuffleInTask() {
        Task {
            await self.shuffleMany()
        }
    }
    
    func shuffleMany() async {
        
        for i in 0..<self.Many {
            if let lender = self.members.randomElement(){
                if let borrower = self.members.randomElement() {
                    lender.lend(borrower: borrower)
                }
            }
            DispatchQueue.main.async{ // make sure to publish values from the main thread
                self.shuffleCount += 1
            }
            if i%1000 == 0 {
                self.updateTotal()
                await Task.yield()
            }
        }
    }
    
    func shuffleManySynchronized() {
        for _ in 0..<self.Many {
            if let lender = self.members.randomElement(){
                if let borrower = self.members.randomElement() {
                    lender.lend(borrower: borrower)
                }
            }
            self.shuffleCount += 1
        }
        self.updateTotal()
        
    }
}
