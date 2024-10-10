import 'package:flutter/material.dart';
import '../LoginScreens/auth_screen.dart';

class ConfigurationScreen extends StatelessWidget {
  const ConfigurationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: const Color(0xFF080E1C),
      body: Center(
        child: Column(
          children: [

            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AuthScreen(),
                  ),
                );
              },
              child: Text('Logout', style: TextStyle(color: Colors.white),),
            )

          ],
        )
      ),
    );
  }
}
