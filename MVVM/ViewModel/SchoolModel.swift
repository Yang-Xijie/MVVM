import Foundation

class SchoolModel: ObservableObject {
    // MARK: - observable model

    @Published private var model = SchoolModel.newSchool()

    private static func newSchool() -> School {
        return School()
    }

    // MARK: - access private varibles in data structure

    var wholeStudents: [School.Student] {
        model.wholeStudents
    }

    // MARK: - modify true data

    func changeStudentNameById(_ id: Int, newName: String) {
        _ = model.updateStudentName(id: id, newName: newName)
    }

    // MARK: - calculate functions / variables

    func getStudentsWhoseGradeGreaterThanNinty() -> [School.Student]? {
        let targetStudents: [School.Student] =
            model.wholeStudents.filter {
                $0.grade >= 90
            }
        if targetStudents.count != 0 {
            return targetStudents
        }
        else {
            return nil
        }
    }

    // same as `func getStudentsWhoseGradeGreaterThanNinty()`
    var studentsWhoseGradeGreaterThanNinty: [School.Student]? {
        let targetStudents: [School.Student] =
            model.wholeStudents.filter {
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
