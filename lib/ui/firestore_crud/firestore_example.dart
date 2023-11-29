import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_demo/other/cmn_ext.dart';
import 'package:flutter_bloc_demo/ui/firestore_crud/model/student_model.dart';

import 'helper/firebase_helper.dart';

class FirestoreExample extends StatefulWidget {
  FirestoreExample({Key? key}) : super(key: key);

  @override
  State<FirestoreExample> createState() => _FirestoreExampleState();
}

class _FirestoreExampleState extends State<FirestoreExample> {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController schoolController = TextEditingController();

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
        body: Column(
          children: [
            fullNameTextField(),
            ageTextField(),
            schoolNameTextField(),
            addStudentButton(),
            studentList()
          ],
        ).safeArea,
      ),
    );
  }

  Widget studentList() {
    return Expanded(
        child: StreamBuilder<QuerySnapshot>(
      stream: FirebaseHelper.instance.getStudentColStream(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }

        List<StudentModel> studentModelList = (snapshot.data?.docs
                .map((DocumentSnapshot e) => StudentModel.fromJson(e.data()))
                .toList() ??
            []);

        return snapshot.data != null
            ? ListView.builder(
                itemCount: studentModelList.length,
                itemBuilder: (context, index) {
                  return studentCard(studentModelList[index], index);
                },
              )
            : Container();
      },
    ));
  }

  studentCard(StudentModel? studentModel, int index) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.2),
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Text(
                    "Student Name : -",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  Text(studentModel?.fullName ?? ""),
                ],
              ),
              Row(
                children: [
                  const Text(
                    "Student Age : -",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  Text(studentModel?.age ?? ""),
                ],
              ),
              Row(
                children: [
                  const Text(
                    "School Name : -",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  Text(studentModel?.scoolName ?? ""),
                ],
              )
            ],
          ),
          Spacer(),
          Row(
            children: [
              const Icon(
                Icons.edit,
                color: Colors.blue,
              ).onClick(() {}),
              const SizedBox(
                width: 10,
              ),
              const Icon(
                Icons.delete,
                color: Colors.red,
              ).onClick(() {
                FirebaseHelper.instance.deleteStudent(studentModel);

              })
            ],
          )
        ],
      ).padding(all: 10),
    );
  }

  Widget addStudentButton() {
    return ElevatedButton(
      onPressed: () async {
         FirebaseHelper.instance.addStudent(StudentModel(
          fullName: fullNameController.text,
          age: ageController.text,
          scoolName: schoolController.text,
        ));
        fullNameController.clear();
        ageController.clear();
        schoolController.clear();
      },
      child: const Text("Add Student"),
    );
  }

  Widget fullNameTextField() {
    return TextField(
      controller: fullNameController,
      decoration: const InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black, width: 0.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black, width: 0.0),
        ),
        hintText: "Enter Name",
        hintStyle: TextStyle(
          color: Colors.grey,
        ),
      ),
    ).padding(all: 10);
  }

  Widget ageTextField() {
    return TextField(
      controller: ageController,
      decoration: const InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black, width: 0.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black, width: 0.0),
        ),
        hintText: "Enter Age",
        hintStyle: TextStyle(
          color: Colors.grey,
        ),
      ),
    ).padding(all: 10);
  }

  Widget schoolNameTextField() {
    return TextField(
      controller: schoolController,
      decoration: const InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black, width: 0.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black, width: 0.0),
        ),
        hintText: "Enter School Name",
        hintStyle: TextStyle(
          color: Colors.grey,
        ),
      ),
    ).padding(all: 10);
  }
}
