import SwiftUI
import CoreData

struct ContentView: View {
    
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

    
    let someNames = ["Frodo", "Samwise", "Merry", "Pippin"]
    
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
                        Text("Team with name \(team.id!)")
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
            .navigationBarTitle("Teams", displayMode: .inline) // ⬅️ Important part
        }
        VStack{
            Button(action: addPerson){
                Text("New Person")
                    .cornerRadius(5)
                    .padding(10)
                    .buttonBorderShape(.roundedRectangle)

            }
            Button(action: createTeamWith2Person){
                Text("New Team with two Persons")
                    .cornerRadius(5)
                    .padding(10)
                    .buttonBorderShape(.roundedRectangle)
            }
            Button(action: {}){
                Text("New Person with two Teams")
                    .cornerRadius(5)
                    .padding(10)
                    .buttonBorderShape(.roundedRectangle)
            }
            Button(action: {}){
                Text("Clear All")
                    .cornerRadius(5)
                    .padding(10)
                    .buttonBorderShape(.roundedRectangle)
            }
        }
    }
    
    private func createTeamWith2Person() {
            withAnimation {
                let newTeam = Team(context: viewContext)
                newTeam.id = UUID()
                newTeam.points = Int64.random(in: 0..<11)
                newTeam.name = someTeams.randomElement()
                
                let newPerson1 = Person(context: viewContext)
                newPerson1.name = "Foo"
                let newPerson2 = Person(context: viewContext)
                newPerson2.name = "Bar"
                
                newTeam.addToRelationship(newPerson1)
                newTeam.addToRelationship(newPerson2)

                do {
                    try viewContext.save()
                } catch {
                    // Replace this implementation with code to handle the error appropriately.
                    // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                    let nsError = error as NSError
                    fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
                }
            }
        }
    
    private func addPerson() {
        withAnimation {
            let newPerson = Person(context: viewContext)
            newPerson.name = someNames.randomElement()
            
            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
    
    private func deletePersons(offsets: IndexSet) {
        withAnimation {
            offsets.map { persons[$0] }.forEach(viewContext.delete)
            
            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
    
    
    private func addTeam() {
        withAnimation {
            let newTeam = Team(context: viewContext)
            newTeam.name = someTeams.randomElement()
            newTeam.id = UUID()
            newTeam.points = Int64.random(in: 0..<11)
            
            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
    
    private func deleteTeams(offsets: IndexSet) {
        withAnimation {
            offsets.map { teams[$0] }.forEach(viewContext.delete)
            
            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
    

    

}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
