
import 'package:firebaseconnected/screens/sign-up.dart';
import 'package:flutter/material.dart';

class Intro extends StatefulWidget {
  const Intro({ Key? key }) : super(key: key);

  @override
  State<Intro> createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          ElevatedButton(onPressed: (){
           Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const SignUp()),
          );
          }, child: const Text("Get Registered!")),
           ElevatedButton(onPressed: (){
          //  Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => const login()),
          // );
          }, child: const Text("Get in to the home!"))
        ]),
      ),
      
    );
  }
}