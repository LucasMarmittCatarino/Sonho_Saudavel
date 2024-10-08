import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              const Text(
                  'Login',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Color(0xFF393839)),
              ),

              const SizedBox(height: 55),

              SizedBox(
                width: 300,
                child: TextField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    labelStyle: TextStyle(color: Color.fromARGB(143, 57, 56, 57)),
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.email, color: Color(0xFF393839)),
                  ),
                ),
              ),
              

              const SizedBox(height: 26),

              SizedBox(
                width: 300,
                child: TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Senha',
                    labelStyle: TextStyle(color: Color.fromARGB(143, 57, 56, 57)),
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.lock, color: Color(0xFF393839)),
                  ),
                ),
              ),

              const SizedBox(height: 26),

              SizedBox(
                width: 140,
                height: 45,
                child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF504EB4),
                ),
                child: const Text(
                  'Entrar',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
                ),
              ),
              )
              
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
