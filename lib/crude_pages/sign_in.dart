import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:worldtime/auth.dart';


class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  String? errorMessage = '';
  bool isLogin = true;


  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();


  Future<void> login() async {
    try{
      // http.Response response = await http.post(
      //     Uri.parse('https://reqres.in/api/login'),
      //     body: {

        await Auth().signInWithEmailAndPass(
            email: emailController.text,
            pass: passController.text);
            // 'email' : email,
            // 'password' : password

      // if(response.statusCode == 200){
      //
      //   var data = jsonDecode(response.body.toString());
      //   print(data['token']);
      //   print('Login successfully');
      //   Navigator.pushNamed(context, '/home');
      //
      // }else {
      //   print('failed');
      // }
    }on FirebaseAuthException catch(e){
      errorMessage = e.message;
      // print(e.toString());
    }
  }

  Future<void> reg() async {
    try{
        await Auth().createUserWithEmailAndPass(
            email: emailController.text,
            pass: passController.text);
    }on FirebaseAuthException catch(e){
      errorMessage = e.message;
      // print(e.toString());
    }
  }

  // Widget _title(){
  //   return const Text('Firebase Auth');
  // }
  // Widget _entryField(String title,
  //     TextEditingController controller,
  //     ){
  //   return TextField(
  //     controller: controller,
  //   );
  // }

  Widget _signInOrReg(){
    return TextButton(
      onPressed: (){
        setState(() {
          isLogin =!isLogin;
        });
      },

        child: Text(isLogin? 'Login': 'Registration'));
  }
 Widget _errorMessage(){
    return Text(errorMessage== ''? '': 'Humm $errorMessage');
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Sign In Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Column(

          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Login page',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              controller: emailController,
              decoration: const InputDecoration(
                hintText: 'Email',
              ),
            ),
            const SizedBox(height: 20.0),
            TextFormField(
              keyboardType: TextInputType.visiblePassword,
              controller: passController,
              decoration: const InputDecoration(
                hintText: 'Password',
              ),
            ),
            const SizedBox(height: 20.0),
            GestureDetector(
              onTap: (){
                // login();
                isLogin? login() :reg();
                // errorText: isLogin ? 'You are logged in' : "Create an account";
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(!isLogin ? 'You are logged in' : "Create an account"))
                );
              },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Center(child: Text(isLogin? 'Login': 'Registration'),),
              ),
            ),
            _signInOrReg(),
          ],

        ),
      ),

    );
  }
}
