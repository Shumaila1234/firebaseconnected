import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebaseconnected/model/singup-model.dart';
import 'package:firebaseconnected/repo/sigup-repo.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController confirmPassword = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  SignupRepo signUpDao = SignupRepo();
  

  void _getRegistered() async {
    final message = SignupModel(
        nameController.text, passwordController.text, confirmPassword.text);
    signUpDao.saveAccData(message);
    const snackBar = SnackBar(
      content: Text('Successfully Registered!'),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);

    // signUpDao.printFirebase();
    signUpDao.getUsers();

  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    passwordController.dispose();
    ageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(children: [
              Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Column(children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: TextFormField(
                          controller: nameController,
                          decoration: const InputDecoration(
                            labelText: "User Name",
                          ),
                          // The validator receives the text that the user has d.
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'User Name';
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: TextFormField(
                          controller: passwordController,
                          decoration: const InputDecoration(
                            labelText: "Password",
                          ),
                          // The validator receives the text that the user has d.
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Password';
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: TextFormField(
                          controller: confirmPassword,
                          decoration: const InputDecoration(
                            labelText: "Confrim Password",
                          ),
                          // The validator receives the text that the user has entered.
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Confrim Password';
                            }
                            return null;
                          },
                        ),
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.lightBlue)),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _getRegistered();
                          }
                        },
                        child: const Text('Submit'),
                      )
                    ]),
                  ))
            ]),
          ),
        ));
  }
}
