import Foundation

struct School {
    // MARK: - core data

    /// students in the school
    var wholeStudents: [Student] = []

    // MARK: - init

    /// load core data from somewhere
    init() {
        wholeStudents = testStudents
    }

    // MARK: - mutating functions

    mutating func updateStudentName(id: Int, newName: String) -> Bool {
        if let indexToUpdate = wholeStudents.firstIndex(where: {
            $0.id == id
        }) {
            wholeStudents[indexToUpdate].name = newName
            print("[School] update student(id \(id))'s name to \(newName)")
            return true
        } else {
            return false
        }
    }

    // MARK: - basic data structure

    struct Student: Identifiable, Hashable {
        // Identifiable
        var id: Int

        var name: String
        var grade: Float
    }
}

extension School.Student: CustomStringConvertible {
    var description: String {
        return "Student \(id), \(name), \(grade)"
    }
}

let testStudents: [School.Student] = [
    School.Student(id: 1, name: "Alice", grade: 89.5),
    School.Student(id: 2, name: "Bob", grade: 93),
    School.Student(id: 3, name: "Cara", grade: 95),
    School.Student(id: 4, name: "Daisy", grade: 84),
]
