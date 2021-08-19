// School.swift

import Foundation

struct School {
    // MARK: -

    var students: [Student] = []

    init() {
        students = testStudents
    }

    // MARK: -

    mutating func updateStudentInfo(id: Int, newName: String) -> Bool {
        if let indexToUpdate = students.firstIndex(where: {
            $0.id == id
        }) {
            students[indexToUpdate].name = newName
            print("[School] updateStudentInfo\n\(students)")
            return true
        } else {
            return false
        }
    }

    // MARK: -

    struct Student: Identifiable, Hashable {
        var id: Int
        var name: String
        var grade: Float

        // Hashable
        static func == (lhs: Student, rhs: Student) -> Bool {
            return lhs.id == rhs.id
        }

        func hash(into hasher: inout Hasher) {
            hasher.combine(id)
        }
    }
}

extension School.Student: CustomStringConvertible {
    var description: String {
        return "Student \(self.id), \(self.name), \(self.grade)"
    }
}

let testStudents: [School.Student] = [
    School.Student(id: 1, name: "aa", grade: 89.5),
    School.Student(id: 2, name: "bb", grade: 93),
    School.Student(id: 3, name: "cc", grade: 95),
    School.Student(id: 4, name: "dd", grade: 84)
]
