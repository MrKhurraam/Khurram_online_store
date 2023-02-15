import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'insertion.dart';

class TestInsertion extends StatefulWidget {
  const TestInsertion({Key? key}) : super(key: key);

  @override
  State<TestInsertion> createState() => _TestInsertionState();
}

class _TestInsertionState extends State<TestInsertion> {
  @override
  Widget build(BuildContext context) {
    InsertionIntoFirebase ins = InsertionIntoFirebase();
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            ins.addUser();
          },
          child: Text('insert'),
        ),
      ),
    );
  }
}
