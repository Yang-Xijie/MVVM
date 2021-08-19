// ContentView.swift

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var MySchool: SchoolModel

    @State var isShowingEditSheet: Bool = false

    var body: some View {
        VStack {
            ExcellentStudentsView()

            Spacer()

            Button("Edit Student Info") {
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
        print("[EditSheet] didDismissSheet()")
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
                .font(.system(.largeTitle))

            HStack {
                TextField("ID", text: $idToUpdate)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("New Name", text: $newName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            .padding([.horizontal])

            Button("Update") {
                print("[EditSheet] Update button clicked")
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

struct ExcellentStudentsView: View {
    @EnvironmentObject var MySchool: SchoolModel

    var body: some View {
        if let students =
            MySchool.getStudentsWhoseGradeGreaterThanNinty()
        // or
        // MySchool.studentsWhoseGradeGreaterThanNinty
        {
            VStack {
                Text("Excellent Students")
                    .font(.system(.largeTitle))

                ScrollView(.vertical) {
                    ForEach(students, id: \.self) { student in
                        StudentView(student: student)
                    }
                }
            }
        } else {
            Text("There are no excellent students.")
        }
    }
}

struct StudentView: View {
    var student: School.Student

    var body: some View {
        HStack {
            Text(student.name)
                .font(.system(.title))

            Spacer()

            VStack(alignment: .leading) {
                Text("ID \(student.id)")
                    .font(.system(.headline))
                Text("Grade \(String(format: "%.1f", student.grade))")
                    .font(.system(.body))
            }
        }
        .padding([.horizontal])
    }
}
