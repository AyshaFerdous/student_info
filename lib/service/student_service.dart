import 'package:firebase_database/firebase_database.dart';
import '../models/student.dart';

class StudentService {
  // Get the Firebase database reference
  final DatabaseReference dbReference = FirebaseDatabase.instance.ref('students');

  // Method to retrieve students as a stream of List<Student>
  Stream<List<Student>> getStudents() {
    return dbReference.onValue.map((event) {
      final data = event.snapshot.value as Map<dynamic, dynamic>? ?? {};
      return data.entries.map((entry) {
        return Student.fromJson(Map<String, dynamic>.from(entry.value))
          ..id = entry.key; // Assign the Firebase key as the student ID
      }).toList();
    });
  }

  // Method to add a new student
  Future<void> addStudent(Student student) async {
    final newStudentRef = dbReference.push(); // Generate a new database reference
    student.id = newStudentRef.key; // Assign the unique key to the student
    await newStudentRef.set(student.toJson()); // Save the student data
  }

  // Method to update an existing student
  Future<void> updateStudent(Student student) async {
    if (student.id != null) {
      await dbReference.child(student.id!).set(student.toJson()); // Update the student data
    }
  }

  // Method to delete a student by their ID
  Future<void> deleteStudent(String studentId) async {
    await dbReference.child(studentId).remove(); // Remove the student data
  }
}
