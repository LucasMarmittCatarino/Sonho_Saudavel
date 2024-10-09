import 'package:flutter/material.dart';

class ProfileDetailsScreen extends StatelessWidget {
  const ProfileDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: const Color(0xFF080E1C),
      body: const Center(
        child: Column(
          children: [

            Text('Detalhe do perfil', style: TextStyle(color: Colors.white),),


          ],
        )
      ),
    );
  }
}
