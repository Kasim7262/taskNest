import 'package:flutter/material.dart';
import 'package:tasknest/screens/home_page.dart';
import 'package:tasknest/services/auth_service.dart';
import 'package:tasknest/widget/custom_textfield.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  final AuthService authService = AuthService();

  bool isLoading = false;

  void signup() async {
    setState(() {
      isLoading = true;
    });

    try {
      await authService.signup(
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
      appBar: AppBar(title: Text("Signup")),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
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
                      onPressed: signup,
                      child: Text('Signup'),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
