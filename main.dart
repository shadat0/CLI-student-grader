import 'dart:io';

void main() {

  // settings
  const appTitle = "Student Grader v1.0";
  print("==== $appTitle ====");
  final subjects = ["Math", "Science", "English", "History"];
  var choice;
  int? numChoice;

  // Student data
  List<Map<String, dynamic>> students = [
    {
        "Name": "Fatima",
        "Scores": [85,92,78,88],
        "Bonus": null,
        "Comment": null
    },
    {
        "Name": "Ali",
        "Scores": [78, 85, 90, 82],
        "Bonus": null,
        "Comment": null
    },
    {
        "Name": "Sara",
        "Scores": [95, 90, 88, 92],
        "Bonus": null,
        "Comment": null
    },
    {
        "Name": "Omar",
        "Scores": [60, 75, 70, 65],
        "Bonus": null,
        "Comment": null
    },
  ];

  // menu loop
  do{
  print('''

  1. Add Student
  2. Record Score
  3. Add Bonus Points
  4. Add Comment
  5. View All Students
  6. View Report Card
  7. Class Summary
  8. Exit

Please enter your choice: 
  ''');
  
  choice = stdin.readLineSync();
numChoice = int.tryParse(choice ?? '');
switch(numChoice){
    case 1:
      print("Add Student Name :");
      String? name = stdin.readLineSync();
      students.add({"Name": name, "Scores": [], "Bonus": null, "Comment": null});
      print("Student added successfully. updated students list: $students"); //testing
      break;
    // case 2:
    //   record score
    //   break;
    // case 3:
    //   add bonus points
    //   break;
    // case 4:
    //   add comment
    //   break;
    // case 5:
    //   view all students
    //   break;
    // case 6:
    //   view report card
    //   break;
    // case 7:
    //   class summary
    //   break;
    case 8:
      print("Exiting...");
      break;
    default:
      print("Invalid choice. Please try again.");
  }
  }
  while(numChoice != 8);
}