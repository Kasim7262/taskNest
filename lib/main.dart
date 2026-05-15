import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tasknest/screens/home_page.dart';
import 'package:tasknest/screens/login_page.dart';
import 'package:tasknest/screens/task_page.dart';

import 'firebase_options.dart';


void main() async {

  // ensures flutter is initialized
  WidgetsFlutterBinding.ensureInitialized();

  // initialize firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      // home: LoginPage(),
      // home: TaskPage(),
      home: FirebaseAuth.instance.currentUser != null
          ? const HomePage()
          : const LoginPage(),
    );
  }
}
