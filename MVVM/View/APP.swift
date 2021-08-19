// myAppApp.swift

import SwiftUI

@main
struct MVVMApp: App {
    @StateObject var MySchool = SchoolModel() // true source of data

    var body: some Scene {
        WindowGroup {
            ContentView()
                // pass `MySchool` to subViews
                // use `@EnvironmentObject var MySchool: SchoolModel` in subViews to use the only one truth of data
                .environmentObject(MySchool)
        }
    }
}
