// School.swift

import Foundation

struct School {
    var students: [Student] = [
        Student(id: 1, name: "aa", grade: 89.5),
        Student(id: 2, name: "bb", grade: 93),
        Student(id: 3, name: "cc", grade: 95),
        Student(id: 4, name: "dd", grade: 84),
    ]

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
