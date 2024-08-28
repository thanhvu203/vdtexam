// ignore_for_file: unused_import

import 'package:vdtexam/file_operations.dart';
import 'package:vdtexam/student_management.dart';
import 'package:vdtexam/student.dart';

void main() async {
  List<Student> students = await loadStudents();
  displayAllStudents(students);

 
  Student newStudent = Student(
    id: 'XYZ-1234',
    name: 'Alice Johnson',
    subjects: [
      Subject(subjectName: 'History', score: 88),
    ],
  );
  addStudent(students, newStudent);
  await saveStudents(students);

  editStudent(students, 'XYZ-1234', newName: 'Alice Smith');
  await saveStudents(students);


  Student? student = searchStudent(students, id: 'XYZ-1234');
  if (student != null) {
    print('Found student: ${student.name}');
  } else {
    print('Student not found');
  }
}

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
