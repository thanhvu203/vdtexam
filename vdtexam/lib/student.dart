class Student {
  final String id;
  String name;
  List<Subject> subjects;

  Student({
    required this.id,
    required this.name,
    required this.subjects,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'subjects': subjects.map((subject) => subject.toJson()).toList(),
      };

  factory Student.fromJson(Map<String, dynamic> json) => Student(
        id: json['id'],
        name: json['name'],
        subjects: (json['subjects'] as List)
            .map((subjectJson) => Subject.fromJson(subjectJson))
            .toList(),
      );
}

class Subject {
  final String subjectName;
  final int score;

  Subject({
    required this.subjectName,
    required this.score,
  });

  Map<String, dynamic> toJson() => {
        'subjectName': subjectName,
        'score': score,
      };

  factory Subject.fromJson(Map<String, dynamic> json) => Subject(
        subjectName: json['subjectName'],
        score: json['score'],
      );
}
