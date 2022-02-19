import 'package:flutter/material.dart';
import 'package:sqlite_test/label_text.dart';
import 'package:sqlite_test/result_page.dart';
import 'package:sqlite_test/student_service.dart';

class StudentsPage extends StatefulWidget {
  const StudentsPage({Key? key}) : super(key: key);

  @override
  State<StudentsPage> createState() => _StudentsPageState();
}

class _StudentsPageState extends State<StudentsPage> {
  final _addStudentFormKey = GlobalKey<FormState>();

  late final String name;
  late final String id;
  late final String age;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Students'),
        centerTitle: true,
      ),
      body: Form(
        key: _addStudentFormKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const LabelText(label: 'Student name'),
              TextFormField(
                autofocus: true,
                onSaved: (value) {
                  name = value!;
                },
              ),
              const LabelText(label: 'Student id'),
              TextFormField(
                onSaved: (value) {
                  id = value!;
                },
              ),
              const LabelText(label: 'Student Age'),
              TextFormField(
                onSaved: (value) {
                  age = value!;
                },
              ),
              ElevatedButton(
                onPressed: () async {
                  bool formValid = _addStudentFormKey.currentState!.validate();

                  if (formValid) {
                    _addStudentFormKey.currentState!.save();
                    _addStudentFormKey.currentState!.reset();

                    bool _userAdded = await StudentService().addUser(
                      id: id,
                      age: age,
                      name: name,
                    );
                  }

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ResultPage(),
                    ),
                  );
                },
                child: const Text('Store Data'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
