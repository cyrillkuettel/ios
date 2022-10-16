import Foundation

actor Member2 {
    
    @MainActor
    private var capital: Int
    
    @MainActor
     func lend(borrower: Member2) async {
        let random: Int = Int.random(in: 0...10_000)
        if self.capital >= random { // prevent negative money values
            self.capital -= random
             borrower.setCapital(c: random)
        }
    }
    
    @MainActor
     func setCapital(c: Int)  {
        self.capital += c
    }
    
    @MainActor
     func getCapital() -> Int {
        return self.capital
    }
    
    
    init() {
        self.capital = 10000
    }
    
}
