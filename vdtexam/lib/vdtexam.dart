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
