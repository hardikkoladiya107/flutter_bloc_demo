import 'dart:convert';

StudentModel studentModelFromJson(String str) => StudentModel.fromJson(json.decode(str));
String studentModelToJson(StudentModel data) => json.encode(data.toJson());
class StudentModel {
  StudentModel({
      String? fullName, 
      String? scoolName, 
      String? age,}){
    _fullName = fullName;
    _scoolName = scoolName;
    _age = age;
}

  StudentModel.fromJson(dynamic json) {
    _fullName = json['full_name'];
    _scoolName = json['scool_name'];
    _age = json['age'];
  }
  String? _fullName;
  String? _scoolName;
  String? _age;
StudentModel copyWith({  String? fullName,
  String? scoolName,
  String? age,
}) => StudentModel(  fullName: fullName ?? _fullName,
  scoolName: scoolName ?? _scoolName,
  age: age ?? _age,
);
  String? get fullName => _fullName;
  String? get scoolName => _scoolName;
  String? get age => _age;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['full_name'] = _fullName;
    map['scool_name'] = _scoolName;
    map['age'] = _age;
    return map;
  }

}