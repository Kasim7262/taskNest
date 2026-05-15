import 'package:flutter/material.dart';
import 'package:tasknest/screens/home_page.dart';
import 'package:tasknest/screens/signup_page.dart';
import 'package:tasknest/services/auth_service.dart';
import 'package:tasknest/widget/custom_textfield.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  final AuthService authService = AuthService();

  bool isLoading = false;

  void login() async {
    setState(() {
      isLoading = true;
    });

    try {
      await authService.login(
        emailController.text.trim(),
        passwordController.text.trim(),
      );

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(e.toString())));
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login Page")),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextField(controller: emailController, hint: 'Email'),
            SizedBox(height: 11),
            CustomTextField(
              controller: passwordController,
              hint: 'Password',
              obscureText: true,
            ),
            SizedBox(height: 11),
            isLoading
                ? CircularProgressIndicator()
                : SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: login,
                      child: Text('Login'),
                    ),
                  ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignupPage()),
                );
              },
              child: Text("Create Account"),
            ),
          ],
        ),
      ),
    );
  }
}
