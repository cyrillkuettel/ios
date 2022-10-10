import Foundation

class Member {

    var capital: Int = 10_000

    func lend(borrower: Member) {
        let random: Int = Int.random(in: 0...10_000)
        self.capital -= random
        borrower.capital += random
    }
    
}
