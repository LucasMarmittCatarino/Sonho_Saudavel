import 'package:flutter/material.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              
              const Text(
                'Bem-vindo!',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Color(0xFF393839)),
              ),

              const SizedBox(height: 55),

              SizedBox(
                width: 250,
                height: 45,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF504EB4),
                  ),
                  child: const Text(
                    'Login',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              
            const SizedBox(height: 25),

              SizedBox(
                width: 250,
                height: 45,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    side: const BorderSide(
                      color: Color(0xFF504EB4),
                      width: 1.5,
                    )
                  ),
                  child: const Text(
                    'Sign Up',
                  style: TextStyle(color: Color(0xFF504EB4), fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
