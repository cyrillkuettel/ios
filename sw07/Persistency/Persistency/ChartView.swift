import SwiftUI
import Charts
import CoreData

struct ChartView: View {
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Team.id, ascending: true)],
        animation: .default)
    private var teams: FetchedResults<Team>
    
    
    
    var body: some View {
            HStack(alignment: .center) {
                Chart(teams) { team in
                    BarMark(x: .value("Points", team.points),
                            y: .value("Name", team.name!))
                    .annotation(position: .overlay, alignment: .center) {
                        Text("\(team.points, format: .number.precision(.fractionLength(0)))")
                            .foregroundColor(.white)
                    }
                }
                
            }
        
    }
}

