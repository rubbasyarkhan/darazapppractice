import 'package:flutter/material.dart';
import 'homepage.dart'; // Make sure this path is correct

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void navigateToHome() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const Homepage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,  
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/logo.png', width: 150, height: 150),
              const SizedBox(height: 30),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[200],          // White background for input
                  labelText: 'Email',
                  labelStyle: TextStyle(color: Colors.black87),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,  // No border line for cleaner look
                  ),
                ),
                style: TextStyle(color: Colors.black87),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[200],
                  labelText: 'Password',
                  labelStyle: TextStyle(color: Colors.black87),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
                style: TextStyle(color: Colors.black87),
              ),
              const SizedBox(height: 25),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrange,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 60,
                    vertical: 15,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: navigateToHome,
                child: const Text(
                  'Login',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
