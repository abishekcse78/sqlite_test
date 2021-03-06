import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  const ResultPage(
      {Key? key, this.studentName, this.studentAge, this.studentID})
      : super(key: key);

  final String? studentName;
  final int? studentAge;
  final int? studentID;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Result page'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: const [
            Text(''),
            Text(''),
            Text(''),
          ],
        ),
      ),
    );
  }
}
