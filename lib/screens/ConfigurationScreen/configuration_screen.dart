import 'package:flutter/material.dart';

class ConfigurationScreen extends StatelessWidget {
  const ConfigurationScreen({super.key});

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

            Text('Configurações', style: TextStyle(color: Colors.white),),


          ],
        )
      ),
    );
  }
}
