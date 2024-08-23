// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
   final String id;
   final String userName;
   final String email;

   UserModel({
    required this.email,
    required this.id,
    required this.userName
   });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': userName,
      'email': email,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] as String,
      userName: map['name'] as String,
      email: map['email'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  factory UserModel.fromDocumentSnapShot(DocumentSnapshot snapshot){
    return UserModel(
      id: snapshot.id, 
      userName: snapshot['name'] ?? '', 
      email: snapshot['email']?? '');
  }

  factory UserModel.fromFirebaseUser (User user){
    return UserModel(
      id: user.uid, 
      userName: user.email!.replaceAll('@gmail.com', ''), 
      email: user.email!);
  }
}
