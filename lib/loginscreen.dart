import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailCtr=TextEditingController();
  TextEditingController passCtr=TextEditingController();
  final FirebaseAuth _firebaseauth=FirebaseAuth.instance;
   Future<String?> signUp() async {
    try {
      UserCredential userCredential = await _firebaseauth.createUserWithEmailAndPassword(
        email: emailCtr.text.toString(),
        password: passCtr.text.toString(),
      );
      return userCredential.user?.uid;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Column(children: [
        TextFormField(controller: emailCtr,),
        SizedBox(height:30),
        TextFormField(controller: passCtr,),
        SizedBox(height: 30,),
        ElevatedButton(onPressed: (){_firebaseauth.createUserWithEmailAndPassword(email: emailCtr.text, password: passCtr.text);}, child: Text("Login")),
      ]),
    );
  }
}