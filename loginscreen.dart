import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:noteapp/homescreen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  bool isLogin = true;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  String errorMessage = '';

  Future<void> _submit() async {
    try {
      if (isLogin) {
        await _auth.signInWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );
      } else {
        await _auth.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );
      }
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const  HomeScreen()),
      );
    } on FirebaseAuthException catch (e) {
      setState(() => errorMessage = e.message ?? 'Something went wrong');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                isLogin ? 'Login Yourself' : 'Create account',
                style: TextStyle(fontSize: 29, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 25),
              TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  prefixIcon: Icon(Icons.lock),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              if (errorMessage.isNotEmpty)
                Text(errorMessage, style: TextStyle(color: Colors.red)),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: _submit,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  minimumSize:  Size.fromHeight(55),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(isLogin ? 'Login' : 'Sign Up', style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    isLogin = !isLogin;
                    errorMessage = '';
                  });
                },
                child: Text(
                  isLogin
                      ? "Don't have an account? Sign up"
                      : "Already have an account? Login",
                  style: TextStyle(fontSize: 17),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
