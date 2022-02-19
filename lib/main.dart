import 'package:flutter/material.dart';
import 'package:sqlite_test/add_student.dart';

void main() {
  runApp(const Students());
}

class Students extends StatelessWidget {
  const Students({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: StudentsPage(),
      ),
    );
  }
}
