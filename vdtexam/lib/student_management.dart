import 'student.dart';

void displayAllStudents(List<Student> students) {
  for (var student in students) {
    print('ID: ${student.id}');
    print('Name: ${student.name}');
    for (var subject in student.subjects) {
      print('Subject: ${subject.subjectName}, Score: ${subject.score}');
    }
    print('---');
  }
}
void addStudent(List<Student> students, Student newStudent) {
  students.add(newStudent);
}
void editStudent(List<Student> students, String id, {String? newName, List<Subject>? newSubjects}) {
  for (var student in students) {
    if (student.id == id) {
      if (newName != null) student.name = newName;
      if (newSubjects != null) student.subjects = newSubjects;
    }
  }
}
Student? searchStudent(List<Student> students, {String? name, String? id}) {
  return students.firstWhere(
    (student) => (name != null && student.name == name) || (id != null && student.id == id),
    orElse: () => null, 
  );
}
