import Foundation

class SchoolModel: ObservableObject {
    @Published private var model = SchoolModel.newSchool()

    private static func newSchool() -> School {
        return School()
    }

    var wholeStudents: [School.Student] {
        model.students
    }

    func changeStudentNameById(_ id: Int, newName: String) {
        _ = model.updateStudentInfo(id: id, newName: newName)
    }

    func getStudentsWhoseGradeGreaterThanNinty() -> [School.Student]? {
        let targetStudents: [School.Student] =
            model.students.filter {
                $0.grade >= 90
            }
        if targetStudents.count != 0 {
            return targetStudents
        }
        else {
            return nil
        }
    }
}
