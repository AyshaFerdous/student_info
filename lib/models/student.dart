class Student {
  String? id;
  final String name;
  final String phone;
  final String location;
  final String email;

  Student({
    this.id,
    required this.name,
    required this.phone,
    required this.location,
    required this.email, required String studentId,
  });

  factory Student.fromJson(Map<String, dynamic> json, [String? id]) {
    return Student(
      id: id,
      name: json['name'] as String,
      phone: json['phone'] as String,
      location: json['location'] as String,
      email: json['email'] as String, studentId: '',
    );
  }

  get studentId => null;

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'phone': phone,
      'location': location,
      'email': email,
    };
  }
}
