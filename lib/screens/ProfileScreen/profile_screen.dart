import 'package:flutter/material.dart';
import '../LoginScreens/auth_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF080E1C),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            const SizedBox(
              height: 200,
              child: Column(
                children: <Widget>[

                  Text(
                    'Primeiro nome',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                  ),

                  Text(
                    'Sobrenome',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400, color: Colors.white),
                  ),

                  SizedBox(
                    height: 10,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '21y | ',
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300, color: Colors.white),
                      ),

                      Text(
                        'Male',
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300, color: Colors.white),
                      ),
                    ],
                  )
                ],
              ),
            ),

            SizedBox(
              width: 230,
              height: 40,
              child: TextButton(
                onPressed: () {
                  //Tela de informações da conta
                },
                style: TextButton.styleFrom(
                  backgroundColor: const Color(0xFF141B2E),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.person, color: Colors.white),
                    SizedBox(width: 8),
                    Text(
                      'Sobre mim',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: 230,
              height: 40,
              child: TextButton(
                onPressed: () {
                  //Tela de 
                },
                style: TextButton.styleFrom(
                  backgroundColor: const Color(0xFF141B2E),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.person, color: Colors.white),
                    SizedBox(width: 8),
                    Text(
                      'Sobre mim',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            

            const SizedBox(height: 20),

            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                    MaterialPageRoute(
                    builder: (context) => const AuthScreen(),
                    ),
                  );
              },
              child: const Text( 
                'Logout ?',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Color(0xFFBDFF4F),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
