import 'dart:async';    
import 'package:flutter/material.dart';    
import 'phone.dart';
import 'activity.dart';
import 'form.dart';
import 'video.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() {
  runApp(new MaterialApp(
    home: new MyApp(),
  ));
}

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => new _MyAppState();
}



class _MyAppState extends State<MyApp> {
  
 void nxt(){

   Future<FirebaseUser> user = FirebaseAuth.instance.currentUser();
   if(user != null){
     Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Phone()),
            );
   }else{
     Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Activity()),
            );
   }
 }


  @override
  void initState() {
    super.initState();
    new Future.delayed(
        const Duration(seconds: 3),
        () => nxt(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: new Column(children: <Widget>[
          new Image.asset(
            'assets/splash.jpeg',
            fit: BoxFit.cover,
            repeat: ImageRepeat.noRepeat,
           // width: 170.0,
          ),
        ]),
      ),
    );
  }
}