import 'package:flutter/material.dart';

class TestLogin extends StatefulWidget {
  const TestLogin({ Key? key }) : super(key: key);

  @override
  _TestLoginState createState() => _TestLoginState();
}

class _TestLoginState extends State<TestLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child:  Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/image/bg.jpg"),
              fit: BoxFit.fill,
            ),
          ),
          child: const  Center(
            child: Text('hello world'),
          )
        ),
      )
    );
  }
}