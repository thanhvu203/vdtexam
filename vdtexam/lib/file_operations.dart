import 'dart:convert';
import 'dart:io';
import 'student.dart';

Future<List<Student>> loadStudents() async {
  final file = File('path/to/Student.json'); 
  final contents = await file.readAsString();
  final jsonData = jsonDecode(contents) as List;
  return jsonData.map((json) => Student.fromJson(json)).toList();
}

Future<void> saveStudents(List<Student> students) async {
  final file = File('path/to/Student.json'); 
  final jsonData = students.map((student) => student.toJson()).toList();
  final contents = jsonEncode(jsonData);
  await file.writeAsString(contents);
}
