void main() {
  String name = "Fidelite";
  int age = 24;
  double gpa = 3.85;
  bool isEnrolled = true;
  String? middleName = null;

  print("Student Information: ${formatStudent(name, age, gpa)}");
  print("Grade Label for GPA: ${gradeLabel(gpa)}");

  List<String> courses = [
    'Flutter Development',
    'Database Systems',
    'Networks',
    'Algorithms',
    'OOP'
  ];

  Map<String, double> grades = {
    'Alice': 3.9,
    'Bob': 3.2,
    'Carol': 3.7,
  };

  print('Top students: ${topStudents(grades)}');

  Course math = Course("Mathematics", 3, "Dr. Smith");
  Course history = Course.elective(name: "History of Art");
  Course science = Course.elective(
    name: "Computer Science",
    creditHours: 4,
    lecturer: "Dr. Johnson",
  );

  StudentRecord student = StudentRecord(name);
  student.enroll(math);
  student.enroll(history);
  student.enroll(science);

  student.printTranscript();
}

String formatStudent(String name, int age, double gpa) =>
    "$name | Age: $age | GPA: $gpa";

String gradeLabel(double score) {
  if (score >= 90) {
    return "A";
  } else if (score >= 80) {
    return "B";
  } else if (score >= 70) {
    return "C";
  } else if (score >= 60) {
    return "D";
  } else {
    return "F";
  }
}

List<String> topStudents(Map<String, double> grades) {
  return grades.entries
      .where((entry) => entry.value >= 3.5)
      .map((entry) => entry.key)
      .toList();
}

class Course {
  String name;
  int creditHours;
  String lecturer;

  Course(this.name, this.creditHours, this.lecturer);

  Course.elective({
    required this.name,
    this.creditHours = 2,
    this.lecturer = "TBD",
  });

  String describe() {
    return "COURSE: $name | $creditHours credits | Taught by: $lecturer";
  }
}

class StudentRecord {
  String studentName;
  List<Course> enrolledCourses = [];

  StudentRecord(this.studentName);

  int get totalCredits {
    int total = 0;
    for (var course in enrolledCourses) {
      total += course.creditHours;
    }
    return total;
  }

  void enroll(Course course) {
    enrolledCourses.add(course);
  }

  void printTranscript() {
    print("=== Transcript for $studentName ===");
    for (var course in enrolledCourses) {
      print(course.describe());
    }
    print("Total Credit Hours: $totalCredits");
  }
}
