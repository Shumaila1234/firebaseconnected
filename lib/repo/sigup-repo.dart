import 'package:firebase_database/firebase_database.dart';
import 'package:firebaseconnected/model/singup-model.dart';
import 'package:flutter/material.dart';

class SignupRepo {
  final DatabaseReference ref = FirebaseDatabase.instance.reference();
  final DatabaseReference _accRef =
      FirebaseDatabase.instance.reference().child('Chat').child("Register");
  final List<User> list = [];
  List users = [];
  var returnValue = "not exists";

  void saveAccData(SignupModel acc) {
    try {
      _accRef.child("user4").set(acc.toJson());
      // _accRef.push().set(acc.toJson());

    } catch (e) {
      print("errorrr:  " + e.toString());
    }
  }

  void pushdata() {
    _accRef
        .child("user1")
        .set({'name': 'Deepak Nishad', 'description': 'Team Lead'});
    _accRef.child("user2").set({'name': 'Alice', 'description': 'Team Lead'});
  }

  Future<String> printFirebase(context) async {
    _accRef.once().then((DataSnapshot snapshot) {
      users.add(snapshot.value);
      Map<String, dynamic> map = Map<String, dynamic>.from(snapshot.value);

      if (map.isNotEmpty) {
        try {
          map.forEach((k, v) {
            if (map[k]['name'] == "Alice") {
              print("exists");
              throw returnValue = "User is already exists";

            }
          });
        } catch (e) {
          print(e);
        }
      } else {
        returnValue = "0 lenght";
      }
    });

    print("returnValue=   " + returnValue);
    return returnValue;
  }

  Query getAccountQuery() {
    print(_accRef.onValue);
    return _accRef;
  }

  getUsers() async {
    final snapshot =
        await FirebaseDatabase.instance.reference().child('Registered').get();

    final map = snapshot.value as Map<dynamic, dynamic>;
    print(snapshot.value);
    map.forEach((key, value) {
      final user = User.fromMap(value);

      list.add(user);
    });

    // print(list);
    return list;
  }

  void updateData() {
    ref.child('-N31DycdBSOezZKfRwDy').update({'name': 'CEO'});
  }
}

class User {
  final String name;
  final String phoneNumber;

  const User({
    required this.name,
    required this.phoneNumber,
  });

  factory User.fromMap(Map<dynamic, dynamic> map) {
    return User(
      name: map['name'] ?? '',
      phoneNumber: map['password'] ?? '',
    );
  }
}
