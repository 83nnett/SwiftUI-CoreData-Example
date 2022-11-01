//
//  ContentView.swift
//  core-data-example
//
//  Created by Bennett on 01/11/2022.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @State var name: String = ""

    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(entity: ExampleEntity.entity(), sortDescriptors: [])

    private var emFetched: FetchedResults<ExampleEntity>
    
    private func addEntity() {
        withAnimation {
            let entity = ExampleEntity(context: viewContext)
            entity.id = UUID()
            entity.name = name

            saveContext()
        }
    }

    private func saveContext() {
        do {
            try viewContext.save()
        } catch {
            let error = error as NSError
            fatalError("An error occurred: \(error)")
        }
    }

    private func deleteEntity(offsets: IndexSet) {
        withAnimation {
            offsets.map { emFetched[$0] }.forEach(viewContext.delete)
            saveContext()
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {

                HStack {
                    TextField("new name", text: $name)

                    Spacer()
                        .frame(width: 25)
                    
                    Button("Add") {
                        addEntity()
                    }
                    .padding(.trailing, 15)
                }
                .frame(maxWidth: .infinity)

                List {
                    ForEach(emFetched) { entity in
                        HStack {
                            Text(entity.name ?? "Blank Name")
                            Spacer()
                        }
                    }
                    .onDelete(perform: deleteEntity)
                }
                .navigationTitle("Name Database")
            }
            .padding()
            .textFieldStyle(RoundedBorderTextFieldStyle())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
