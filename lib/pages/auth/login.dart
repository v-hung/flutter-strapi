import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.android,
          size: 100,
        ),
        const SizedBox(height: 75,),

        const Text(
          "Hello Again!",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 36
          ),
        ),
        const SizedBox(height: 10,),
        const Text(
          "Welcome back, you\'ve been missed!",
          style: TextStyle(
            fontSize: 20
          ),
        ),
        const SizedBox(height: 50,),

        // email field
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[200],
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(12)
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Email'
                ),
              ),
            ),
          ),
        ),

        const SizedBox(height: 10,),

        // password field
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[200],
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(12)
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Password'
                ),
              ),
            ),
          ),
        ),

        const SizedBox(height: 10,),

        // button signin
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            decoration: BoxDecoration(
              color: Colors.deepPurple,
              borderRadius: BorderRadius.circular(12)
            ),
            child: const Center(
              child: Text(
                "Sign In",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18
                ),
              ),
            ),
          ),
        ),

        const SizedBox(height: 25,),

        // not a member
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              "Not a member?",
              style: TextStyle(
                fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(width: 10,),
            Text(
              'Register now',
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold
              ),
            )
          ],
        )
      ],
    );
  }
}