import Foundation

actor Community2 : ObservableObject{
    
    
    @Published @MainActor var members: [Member2] =  [Member2(), Member2(), Member2(), Member2(), Member2()]
    let Many = 100_000
    let Few = 1_000
    
    @Published @MainActor var lastTotal: Int = 0
    
    @Published @MainActor var initialTotal: Int = 0
    
    
    @MainActor @Published var shuffleCount: Int = 0

    @MainActor
    public func updateTotal() {
        Task {
            self.lastTotal = await self.members.asyncMap({ $0.getCapital()}).reduce(0, +)
            self.initialTotal = await self.members.asyncMap({ $0.getCapital()}).reduce(0, +)

        }
    }
    
    @MainActor
    public func shuffleConcurrent() async {
        await shuffleMany()
    }
    
    @MainActor
    public func shuffleInTask() async {
        await shuffleMany()
    }
    
    @MainActor
    func shuffleMany() async {
        
        for i in 0..<self.Many {
            if let lender =  self.members.randomElement(){
                if let borrower =  self.members.randomElement() {
                    await lender.lend(borrower: borrower)
                }
            }
            self.shuffleCount += 1
            
            if i%1000 == 0 {
                self.updateTotal()
                await Task.yield()
            }
        }
    }
    
}


extension Sequence {
    func asyncMap<T>(
        _ transform: (Element) async throws -> T
    ) async rethrows -> [T] {
        var values = [T]()
        
        for element in self {
            try await values.append(transform(element))
        }
        
        return values
    }
}
