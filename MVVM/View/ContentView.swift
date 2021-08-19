// ContentView.swift

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var MySchool: SchoolModel

    @State var isShowingEditSheet: Bool = false

    var body: some View {
        VStack {
            Text("Students")
            if let students = MySchool.getStudentsWhoseGradeGreaterThanNinty() {
                VStack {
                    ScrollView(.vertical) {
                        ForEach(students, id: \.self) { student in
                            StudentView(student: .constant(student))
                        }
                    }
                }
            } else {
                Text("No students.")
            }

            Spacer()

            Button("Show Edit Sheet") {
                isShowingEditSheet = true
            }
        }
        .padding()
        .sheet(
            isPresented: $isShowingEditSheet,
            onDismiss: didDismissSheet
        ) {
            EditSheet(isShowingSelf: $isShowingEditSheet)
        }
    }

    private func didDismissSheet() {
        print("didDismissSheet()")
    }
}

struct EditSheet: View {
    @EnvironmentObject var MySchool: SchoolModel

    @Binding var isShowingSelf: Bool
    @State var idToUpdate: String = ""
    @State var newName: String = ""

    var body: some View {
        VStack {
            Text("Update student Info")
            HStack {
                TextField("ID", text: $idToUpdate)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("New Name", text: $newName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }

            Button("Update") {
                print("Clicked")
                updateStudentName()
                isShowingSelf = false
            }
        }
    }

    private func updateStudentName() {
        if let id = Int(idToUpdate) {
            MySchool.changeStudentNameById(id, newName: newName)
        }
    }
}

struct StudentView: View {
    @Binding var student: School.Student

    var body: some View {
        Text(student.description)
    }
}
