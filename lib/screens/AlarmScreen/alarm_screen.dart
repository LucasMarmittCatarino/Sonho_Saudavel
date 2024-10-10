import 'package:flutter/material.dart';

class AlarmScreen extends StatefulWidget {
  const AlarmScreen({super.key});

  @override
  _AlarmScreenState createState() => _AlarmScreenState();
}

class _AlarmScreenState extends State<AlarmScreen> {
  TimeOfDay _selectedTime = TimeOfDay.now();

  Future<void> _selectTime(BuildContext context) async {
    // Abre o seletor de hora
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );
    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF080E1C),
      body: Padding(
        padding: const EdgeInsets.only(top: 80.0),
        child: Center(
          child: Column(
            children: [

              const SizedBox(
                child: Text(
                  'A que horas você pretende acordar?',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

              const SizedBox(height: 40),

              SizedBox(
                width: 300,
                height: 300,
                child: Image.asset(
                  'lib/assets/png/sun.png',
                  fit: BoxFit.cover,
                ),
              ),

              const SizedBox(height: 60),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 100,
                    height: 2,
                    color: Colors.white,
                  ),

                  const SizedBox(width: 20),

                  TextButton(
                    onPressed: () => _selectTime(context),
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      backgroundColor: Colors.transparent,
                    ),
                    child: Text(
                      _selectedTime.format(context),
                      style: const TextStyle(color: Colors.white, fontSize: 36),
                    ),
                  ),

                  const SizedBox(width: 20),

                  Container(
                    width: 100,
                    height: 2,
                    color: Colors.white,
                  ),
                ],
              ),

              const SizedBox(height: 70),

              SizedBox(
                width: 300,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    
                  }, 
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF151A2E),
                  ),
                  child: const Text(
                    'Definir alarme',
                    style: TextStyle(color: Colors.white),
                  )
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
