import Foundation

class Member {
    
     var capital: Int

    func lend(borrower: Member) {
        let random: Int = Int.random(in: 0...10_000)
        if self.capital >= random { // prevent negative capital values
            self.capital -= random
            borrower.capital += random
        }
    }

    
    init() {
        self.capital = 10000
    }
    
    
}

