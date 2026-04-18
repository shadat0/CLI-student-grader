import 'dart:io';

void main() {
  // settings
  const appTitle = "Student Grader v1.0";
  print("==== $appTitle ====");
  final subjects = ["Math", "Science", "English"];

  // Student data
  List<Map<String, dynamic>> students = [
    {
      "Name": "Fatima",
      "Scores": [85, 92, 78],
      "Bonus": null,
      "Comment": null,
    },
    {
      "Name": "Ali",
      "Scores": [78, 85, 90],
      "Bonus": null,
      "Comment": null,
    },
    {
      "Name": "Sara",
      "Scores": [95, 90, 88],
      "Bonus": null,
      "Comment": null,
    },
    {
      "Name": "Omar",
      "Scores": [60, 75, 70],
      "Bonus": null,
      "Comment": null,
    },
  ];

  // Main menu
  int choice;
  do {
    print("\n");
    print('''

  1. Add Student
  2. Record Score
  3. Add Bonus Points
  4. Add Comment
  5. View All Students
  6. View Report Card
  7. Class Summary
  8. Exit

  ''');

    print("Choose an option: ");
    choice = int.parse(stdin.readLineSync()!);

    switch (choice) {
      case 1:
        print("Add Student Name :");
        var name = stdin.readLineSync()!;
        students.add({
          "Name": name,
          "Scores": [],
          "Subjects": {...subjects},
          "Bonus": null,
          "Comment": null,
        });
        print("✅ Student - $name added successfully.");
        break;
      case 2:
        // 1. Show numbered list of students
        print("--- Select a Student ---");
        for (int i = 0; i < students.length; i++) {
          print("${i + 1}. ${students[i]["Name"]}");
        }
        print("Enter student number:");
        var studentChoice = int.parse(stdin.readLineSync()!);

        if (studentChoice < 1 || studentChoice > students.length) {
          print("❌ Invalid student selection.");
          break;
        }

        var selectedStudent = students[studentChoice - 1];

        // 2. Show available subjects
        print("\n--- Select a Subject ---");
        for (int i = 0; i < subjects.length; i++) {
          print("${i + 1}. ${subjects[i]}");
        }
        print("Enter subject number:");
        var subjectChoice = int.parse(stdin.readLineSync()!);

        if (subjectChoice < 1 || subjectChoice > subjects.length) {
          print("❌ Invalid subject selection.");
          break;
        }

        var selectedSubject = subjects[subjectChoice - 1];

        // 3. Validating score with a while loop 
        int score = -1;
        while (score < 0 || score > 100) {
          print(
            "Enter score for ${selectedStudent["Name"]} in $selectedSubject (0-100):",
          );
          score = int.parse(stdin.readLineSync()!);
          if (score < 0 || score > 100) {
            print("❌ Score must be between 0 and 100.");
          }
        }

        // 4. Add the score to the student's scores list
        selectedStudent["Scores"].add(score);
        print(
          "✅ Score $score added for ${selectedStudent["Name"]} in $selectedSubject!",
        );
        break;

      case 3:
        // 1. Show numbered list of students
        print("--- Select a Student ---");
        for (int i = 0; i < students.length; i++) {
          print("${i + 1}. ${students[i]["Name"]}");
        }
        print("Enter student number:");
        var studentChoice = int.parse(stdin.readLineSync()!);

        if (studentChoice < 1 || studentChoice > students.length) {
          print("❌ Invalid student selection.");
          break;
        }

        var selectedStudent = students[studentChoice - 1];

        // 2. Validating bonus points with a while loop
        int bonus = -1;
        while (bonus < 0 || bonus > 10) {
          print("Enter bonus points for ${selectedStudent["Name"]} (0-10):");
          bonus = int.parse(stdin.readLineSync()!);
          if (bonus < 0 || bonus > 10) {
            print("❌ Bonus points must be between 0 and 10.");
          }
        }

      // case 4 - 7 working on currently
      case 8:
        print("Exiting...");
        break;
      default:
        print("Invalid choice. Please try again.");
    }
  } while (choice != 8);
}


