import SwiftUI
import CoreData

struct EditView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Person.name, ascending: true)],
        animation: .default)
    private var persons: FetchedResults<Person>
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Team.id, ascending: true)],
        animation: .default)
    private var teams: FetchedResults<Team>
    
    let persistentContainer = PersistenceController.shared.container

    let maxPoints: Int64 = 100
    let someNames = ["Frodo", "Samwise", "Merry", "Pippin", "Oliver", "Bob", "Sarah", "Anita", "Ethan"]
    
    let someTeams =
    ["HomeRunnerz",
     "Four Baggers",
     "SlumpBuster",
     "Hit Machines",
     "Little League Wannabe",
     "Evil Empire",
     "Softball Jones",
     "Alley Cats",
     "Street Gang",
     "The Sandlotters"]
    
    var body: some View {
        
        ZStack {
            VStack {
                NavigationView {
                    
                    List {
                        ForEach(persons) { person in
                            NavigationLink {
                                Text("Person with name \(person.name!)")
                            } label: {
                                Text(person.name!)
                            }
                        }
                        .onDelete(perform: deletePersons)
                    }
                    
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            EditButton()
                        }
                    }
                    .navigationBarTitle("Persons", displayMode: .inline)
                }
                NavigationView {
                    List {
                        ForEach(teams) { team in
                            NavigationLink {
                                Text("Team \(team.name!)")
                                ForEach(getPersonsOfTeam(team: team)) { person in
                                    Text("has Member \(person.name!)")
                                }
                            } label: {
                                Text(team.name!)
                            }
                        }
                        .onDelete(perform: deleteTeams)
                    }
                    
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            EditButton()
                        }
                    }
                    .navigationBarTitle("Teams", displayMode: .inline)
                }
                
                
                Button(action: addPerson){
                    Text("New Person")
                        .cornerRadius(5)
                        .padding(10)
                        .buttonBorderShape(.roundedRectangle)
                    
                }
                Button(action: createTeamWith2Person){
                    Text("New Team with two new Persons")
                        .cornerRadius(5)
                        .padding(10)
                        .buttonBorderShape(.roundedRectangle)
                }
                Button(action: createPersonIn2Teams){
                    Text("New Person in two new Teams")
                        .cornerRadius(5)
                        .padding(10)
                        .buttonBorderShape(.roundedRectangle)
                }
                Button(action: clearAll){
                    Text("Clear All")
                        .cornerRadius(5)
                        .padding(10)
                        .buttonBorderShape(.roundedRectangle)
                }
            }
        }
    }
    
    
    private func getPersonsOfTeam(team: Team) -> Array<Person> {
        
        let personsOfTeam = team.relationship?.allObjects as! [Person]
        
//        if personsOfTeam.count != 2 {
//            fatalError("More than two Persons in relationship found")
//        }
        
        for person in personsOfTeam {
           print("The Team \(team.name) has member \(person.name)")
        }
        
        return personsOfTeam
    }
    
    
    private func createTeamWith2Person() {
            withAnimation {
                let newTeam = Team(context: viewContext)
                newTeam.id = UUID()
                newTeam.points = Int64.random(in: 0..<maxPoints)
                newTeam.name = someTeams.randomElement()
                
                let newPerson1 = Person(context: viewContext)
                newPerson1.name = someNames.randomElement()
                
                let newPerson2 = Person(context: viewContext)
                newPerson2.name = someNames.randomElement()
                
                newTeam.addToRelationship(newPerson1)
                newTeam.addToRelationship(newPerson2)

                tryToSaveOrFail()
            }
        }
    
    private func createPersonIn2Teams() {
        withAnimation {
            
            let newTeam = Team(context: viewContext)
            newTeam.id = UUID()
            newTeam.points = Int64.random(in: 0..<maxPoints)
            
            let newTeam2 = Team(context: viewContext)
            newTeam2.id = UUID()
            newTeam2.points = Int64.random(in: 0..<maxPoints)
            
            
            let selectedNames = someTeams.choose(2)
            newTeam.name = selectedNames[0]
            newTeam2.name = selectedNames[1]
            
            let newPerson1 = Person(context: viewContext)
            newPerson1.name = someNames.randomElement()
            newPerson1.addToRelationship(newTeam)
            newPerson1.addToRelationship(newTeam2)

            tryToSaveOrFail()
        }
        
    }
    
    private func addPerson() {
        withAnimation {
            let newPerson = Person(context: viewContext)
            newPerson.name = someNames.randomElement()
            
            tryToSaveOrFail()
        }
    }
    

    
    private func deletePersons(offsets: IndexSet) {
        withAnimation {
            offsets.map { persons[$0] }.forEach(viewContext.delete)
            
            tryToSaveOrFail()
        }
    }
    
    
    private func addTeam() {
        withAnimation {
            let newTeam = Team(context: viewContext)
            newTeam.name = someTeams.randomElement()
            newTeam.id = UUID()
            newTeam.points = Int64.random(in: 0..<maxPoints)
            
            tryToSaveOrFail()
        }
    }
    
    private func deleteTeams(offsets: IndexSet) {
        withAnimation {
            offsets.map { teams[$0] }.forEach(viewContext.delete)
            tryToSaveOrFail()
        }
    }
    
    func clearAll() {
        withAnimation {
            persons.forEach { viewContext.delete($0) }
            teams.forEach { viewContext.delete($0) }
            tryToSaveOrFail()
        }
    }
    
    private func tryToSaveOrFail() {
        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
    

    

}
extension DefaultStringInterpolation {
// https://stackoverflow.com/questions/42543007/how-to-solve-string-interpolation-produces-a-debug-description-for-an-optional
  mutating func appendInterpolation<T>(_ optional: T?) {
    appendInterpolation(String(describing: optional))
  }
}

// pick N items from collection
extension Collection {
    func choose(_ n: Int) -> ArraySlice<Element> { shuffled().prefix(n) }
}


struct EditView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext,
                                   PersistenceController.preview.container.viewContext)
    }
}
