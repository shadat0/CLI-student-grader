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

      case 4:
        // 1. Show numbered list of students
        print("--- Select a Student ---");
        for (int i = 0; i < students.length; i++) {
          print("${i + 1}. ${students[i]["Name"]}");
        }
        print("Enter student number:");
        var commentStudentChoice = int.parse(stdin.readLineSync()!);

        if (commentStudentChoice < 1 ||
            commentStudentChoice > students.length) {
          print("❌ Invalid student selection.");
          break;
        }

        var commentStudent = students[commentStudentChoice - 1];

        // 2. Prompt for a comment and making sure its nullable
        print("Enter comment for ${commentStudent["Name"]}:");
        String? comment = stdin.readLineSync();

        // 3. Storing the comment
        commentStudent["Comment"] = comment;

        // 4. Displaying the comment
        print(
          "✅ Comment saved: ${commentStudent["Comment"]?.toUpperCase() ?? "No comment"}",
        );
        break;


      case 5:
        print("\n--- All Students ---");
        for (var student in students) {
          // bonus list building
          var info = [
            "📛 ${student["Name"]}",
            "   Scores recorded: ${student["Scores"].length}",
            if (student["Bonus"] != null) "   ⭐ Bonus: ${student["Bonus"]}",
          ];
          for (var line in info) {
            print(line);
          }
        }
        break;
      case 6:
        // 1. Show numbered list of students
        print("--- Select a Student ---");
        for (int i = 0; i < students.length; i++) {
          print("${i + 1}. ${students[i]["Name"]}");
        }
        print("Enter student number:");
        var reportChoice = int.parse(stdin.readLineSync()!);
        //checking if choice less than 1 or more then the student number , using logical or operator
        if (reportChoice < 1 || reportChoice > students.length) {
          print("❌ Invalid student selection.");
          break;
        }

        var reportStudent = students[reportChoice - 1];
        List scores = reportStudent["Scores"];

        if (scores.isEmpty) {
          print("⚠️ No scores recorded for ${reportStudent["Name"]}.");
          break;
        }

        // 2. Calculate raw average using a for loop
        num sum = 0;
        for (var s in scores) {
          sum = sum + s;
        }
        double rawAvg = sum / scores.length;

        // 3. Add bonus (using ??) and cap at 100
        double finalAvg = rawAvg + (reportStudent["Bonus"] ?? 0);
        if (finalAvg > 100) finalAvg = 100;

        // 4. Assign grade letter using if / else if
        String grade;
        if (finalAvg >= 90) {
          grade = "A";
        } else if (finalAvg >= 80) {
          grade = "B";
        } else if (finalAvg >= 70) {
          grade = "C";
        } else if (finalAvg >= 60) {
          grade = "D";
        } else {
          grade = "F";
        }

        // 5. Feedback using switch expression with pattern matching
        String feedback = switch (grade) {
          "A" => "Outstanding performance!",
          "B" => "Good work, keep it up!",
          "C" => "Satisfactory. Room to improve.",
          "D" => "Needs improvement.",
          "F" => "Failing. Please seek help.",
          _ => "Unknown grade.",
        };

        // 6. Print formatted report card using multi-line string (using padRight() took ai help here to get it look beautiful and align the text)
        print('''
-------------------------------
|       REPORT CARD           |
-------------------------------
|  Name:    ${reportStudent["Name"].toString().padRight(18)}|
|  Scores:  ${scores.toString().padRight(18)}|
|  Bonus:   +${(reportStudent["Bonus"] ?? 0).toString().padRight(17)}|
|  Average: ${finalAvg.toStringAsFixed(1).padRight(18)}|
|  Grade:   ${grade.padRight(18)}|
|  Comment: ${(reportStudent["Comment"]?.toUpperCase() ?? "None").toString().padRight(18)}|
-------------------------------
📢 $feedback''');
        break;
      case 7:
        print("\n--- Class Summary ---\n");

        int totalStudents = students.length;
        int passCount = 0;
        double classTotal = 0;
        double highestAvg = 0;
        double lowestAvg = 101;
        Set<String> gradeSet = {};

        // Build student name list using collection for
        var summaryLines = [for (var s in students) s["Name"].toString()];
        print("All Students: $summaryLines");

        // Compute stats for each student
        for (var student in students) {
          List scores = student["Scores"];

          if (scores.isNotEmpty) {
            // Sum scores using a simple for loop
            num sum = 0;
            for (var score in scores) {
              sum = sum + score;
            }
            double avg = sum / scores.length;
            double finalAvg = avg + (student["Bonus"] ?? 0);
            if (finalAvg > 100) finalAvg = 100;

            classTotal = classTotal + finalAvg;

            // Logical && — count students who have scores and are passing
            if (scores.isNotEmpty && finalAvg >= 60) passCount++;

            // Track highest and lowest
            if (finalAvg > highestAvg) highestAvg = finalAvg;
            if (finalAvg < lowestAvg) lowestAvg = finalAvg;

            // Assign grade and add to Set (duplicates are ignored automatically)
            String grade;
            if (finalAvg >= 90) {
              grade = "A";
            } else if (finalAvg >= 80) {
              grade = "B";
            } else if (finalAvg >= 70) {
              grade = "C";
            } else if (finalAvg >= 60) {
              grade = "D";
            } else {
              grade = "F";
            }
            gradeSet.add(grade);
          }
        }

        double classAvg = classTotal / totalStudents;

        print("Total Students  : $totalStudents");
        print("Class Average   : ${classAvg.toStringAsFixed(1)}");
        print("Highest Average : ${highestAvg.toStringAsFixed(1)}");
        print(
          "Lowest Average  : ${lowestAvg == 101 ? "N/A" : lowestAvg.toStringAsFixed(1)}",
        );
        print("Passing Students: $passCount");
        print("Grades in Class : $gradeSet");
        break;
      case 8:
        print("Exiting...");
        break;
      default:
        print("Invalid choice. Please try again.");
    }
  } while (choice != 8);
}
