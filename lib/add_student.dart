import 'package:firebase_note_app_realtime_db/service/student_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'models/student.dart';

class AddStudent extends StatefulWidget {
  const AddStudent({super.key});

  @override
  State<AddStudent> createState() => _AddStudentState();
}

class _AddStudentState extends State<AddStudent> {
  final nameController = TextEditingController();
  final studentIdController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final locationController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey();
  final StudentService studentService = StudentService();

  Future addStudent() async {
    final newStudent = Student(
      name: nameController.text,
      studentId: studentIdController.text,
      phone: phoneController.text,
      email: emailController.text,
      location: locationController.text,
    );

    await studentService.addStudent(newStudent);
    Get.back();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Student'),
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
                      addStudent();
                    }
                  },
                  child: const Text('Save Student'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
