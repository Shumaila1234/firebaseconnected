import 'package:firebase_database/firebase_database.dart';
import 'package:firebaseconnected/model/singup-model.dart';

class SignupRepo {
  final DatabaseReference _accRef =
      FirebaseDatabase.instance.reference().child('Registered');

  void saveAccData(SignupModel acc) {
    try {
      _accRef.push().set(acc.toJson());
    } catch (e) {
      print("errorrr:  " + e.toString());
    }
  }

  void printFirebase() {
    _accRef.once().then((DataSnapshot snapshot) {
      print('Data : ${snapshot.value}');
    });
  }

  Query getAccountQuery() {
    print(_accRef.onValue);
    return _accRef;
  }

   final List<User> list = [];

  getUsers() async {
    final snapshot = await FirebaseDatabase.instance.reference().child('Registered').get();

    final map = snapshot.value as Map<dynamic, dynamic>;

    map.forEach((key, value) {
      final user = User.fromMap(value);

      list.add(user);
    });
    print(map);
print(list.length);
print(list);
    return list;
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