import 'package:flutter/material.dart';

class FirestoreExample extends StatelessWidget {
  const FirestoreExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Flutter FireStore Example"),
        ),
        body: const Column(
          children: [],
        ),
      ),
    );
  }
}
