import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/student_model.dart';

class FirebaseHelper{

  static final FirebaseHelper _instance = FirebaseHelper._internal();

  static FirebaseHelper get instance => _instance;

  final CollectionReference collection = FirebaseFirestore.instance.collection("students");

  FirebaseHelper._internal(){

  }




  Future<void> addStudent(StudentModel student) async {
    //collection.add(student.toJson());
   await collection.doc(student.fullName).set(student.toJson());
  }


  Stream<QuerySnapshot> getStudentColStream(){
    return collection.snapshots();
  }

  Future<List<StudentModel>> getStudent() async {
    QuerySnapshot querySnapshot = await collection.get();
    List<StudentModel> allData = querySnapshot.docs.map((e) => StudentModel.fromJson(e.data())).toList();
    return allData;
  }



  deleteAllDocumentInCollection(CollectionReference<Object?> products) {
    WriteBatch batch = FirebaseFirestore.instance.batch();
    return collection.get().then((querySnapshot) {
      querySnapshot.docs.forEach((document) {
        batch.delete(document.reference);
      });
      return batch.commit();
    });
  }

  void deleteStudent(StudentModel? studentModel) {
    collection.doc(studentModel?.fullName).delete();
  }


  updateStudent(StudentModel? studentModel){
    collection.doc(studentModel?.fullName).update({});
  }


  
}