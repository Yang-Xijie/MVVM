import Foundation

class SchoolModel: ObservableObject {
    static var shared = SchoolModel()

    @Published var school = School()

    var wholeStudents: [School.Student] {
        return school.students
    }

    func changeStudentNameById(_ id: Int, newName: String) {
        _ = SchoolModel.shared.school.updateStudentInfo(id: id, newName: newName)
    }

    func getStudentsWhoseGradeGreaterThanNinty() -> [School.Student]? {
        let targetStudents: [School.Student] =
            SchoolModel.shared.school.students.filter {
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
