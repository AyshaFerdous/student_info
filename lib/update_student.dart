import 'package:firebase_note_app_realtime_db/service/student_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'models/student.dart';


class UpdateStudent extends StatefulWidget {
  final Student student;
  const UpdateStudent({super.key, required this.student});

  @override
  State<UpdateStudent> createState() => _UpdateStudentState();
}

class _UpdateStudentState extends State<UpdateStudent> {
  late TextEditingController nameController;
  late TextEditingController studentIdController;
  late TextEditingController phoneController;
  late TextEditingController emailController;
  late TextEditingController locationController;

  final GlobalKey<FormState> formKey = GlobalKey();
  final StudentService studentService = StudentService();

  Future updateStudent() async {
    final updatedStudent = Student(
      id: widget.student.id,
      name: nameController.text,
      studentId: studentIdController.text,
      phone: phoneController.text,
      email: emailController.text,
      location: locationController.text,
    );

    await studentService.updateStudent(updatedStudent);
    Get.back();
  }

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.student.name);
    studentIdController = TextEditingController(text: widget.student.studentId);
    phoneController = TextEditingController(text: widget.student.phone);
    emailController = TextEditingController(text: widget.student.email);
    locationController = TextEditingController(text: widget.student.location);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Student'),
        backgroundColor: Colors.blue,
      ),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  controller: nameController,
                  decoration: const InputDecoration(labelText: 'Name'),
                  validator: (value) => value == null || value.isEmpty ? 'Please enter name' : null,
                ),
                TextFormField(
                  controller: studentIdController,
                  decoration: const InputDecoration(labelText: 'Student ID'),
                  validator: (value) => value == null || value.isEmpty ? 'Please enter student ID' : null,
                ),
                TextFormField(
                  controller: phoneController,
                  decoration: const InputDecoration(labelText: 'Phone'),
                  validator: (value) => value == null || value.isEmpty ? 'Please enter phone number' : null,
                ),
                TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(labelText: 'Email'),
                  validator: (value) => value == null || value.isEmpty ? 'Please enter email' : null,
                ),
                TextFormField(
                  controller: locationController,
                  decoration: const InputDecoration(labelText: 'Location'),
                  validator: (value) => value == null || value.isEmpty ? 'Please enter location' : null,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      updateStudent();
                    }
                  },
                  child: const Text('Update Student'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}