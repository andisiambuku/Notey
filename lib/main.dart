import 'package:flutter/material.dart';
import 'package:notey/screens/signup.dart';
import 'package:notey/utils/auth.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Authentication.initializeFirebase(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text('Something went wrong');
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return MaterialApp(
              title: 'notey',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(primarySwatch: Colors.orange),
              home: const SignUp(),
            );
          }
          return const CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),
          );
        });
  }
}
