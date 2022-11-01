# SwiftUI-CoreData-Example

A small application to demonstrate an easy implentation of how to include Core Data within a SwiftUI application.

A beginners explanation to CoreData and the codebase:

* ExampleModel.xcdatamodeld - This file is the storage file, where you declare components.
* Persistance.swift - This file loads the model exported by ExampleModel, and assigns it.
* ContentView.swift - This file contains the necessary functions to load in the persisted state and modify it (updating / deleting / viewing values)
