import 'package:flutter/material.dart';
import 'package:sqlite_test/label_text.dart';
import 'package:sqlite_test/result_page.dart';

class StudentsPage extends StatefulWidget {
  const StudentsPage({Key? key}) : super(key: key);

  @override
  State<StudentsPage> createState() => _StudentsPageState();
}

class _StudentsPageState extends State<StudentsPage> {
  final _addUserFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Students'),
        centerTitle: true,
      ),
      body: Form(
        key: _addUserFormKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const LabelText(label: 'Student name'),
              TextFormField(
                autofocus: true,
              ),
              const LabelText(label: 'Student id'),
              TextFormField(),
              const LabelText(label: 'Student Age'),
              TextFormField(),
              ElevatedButton(
                onPressed: () {
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
