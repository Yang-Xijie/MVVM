// myAppApp.swift

import SwiftUI

@main
struct MVVMApp: App {
    @StateObject var MySchool = SchoolModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(MySchool)
        }
    }
}
