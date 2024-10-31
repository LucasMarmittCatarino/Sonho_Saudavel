import 'package:flutter/material.dart';
import 'login_screen.dart';
import '../../database/auth_service.dart';

class SignUpDetailsScreen extends StatefulWidget {
  final String name;
  final String email;
  final String password;

  const SignUpDetailsScreen({
    super.key,
    required this.name,
    required this.email,
    required this.password,
  });

  @override
  _SignUpDetailsScreenState createState() => _SignUpDetailsScreenState();
}

class _SignUpDetailsScreenState extends State<SignUpDetailsScreen> {
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  String _selectedGender = 'Masculino';

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
                'Cadastro',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Color(0xFF393839)),
              ),
              const SizedBox(height: 55),

              SizedBox(
                width: 300,
                child: TextField(
                  controller: _ageController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Idade',
                    labelStyle: TextStyle(color: Color.fromARGB(143, 57, 56, 57)),
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.cake, color: Color(0xFF393839)),
                  ),
                ),
              ),
              const SizedBox(height: 26),

              SizedBox(
                width: 300,
                child: DropdownButtonFormField<String>(
                  value: _selectedGender,
                  items: ['Masculino', 'Feminino', 'Outro']
                      .map((gender) => DropdownMenuItem(
                            value: gender,
                            child: Text(gender),
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedGender = value!;
                    });
                  },
                  decoration: const InputDecoration(
                    labelText: 'Sexo',
                    labelStyle: TextStyle(color: Color.fromARGB(143, 57, 56, 57)),
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.person, color: Color(0xFF393839)),
                  ),
                ),
              ),
              const SizedBox(height: 26),

              SizedBox(
                width: 300,
                child: TextField(
                  controller: _weightController,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  decoration: const InputDecoration(
                    labelText: 'Peso (kg)',
                    labelStyle: TextStyle(color: Color.fromARGB(143, 57, 56, 57)),
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.fitness_center, color: Color(0xFF393839)),
                  ),
                ),
              ),
              const SizedBox(height: 26),

              SizedBox(
                width: 300,
                child: TextField(
                  controller: _heightController,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  decoration: const InputDecoration(
                    labelText: 'Altura (cm)',
                    labelStyle: TextStyle(color: Color.fromARGB(143, 57, 56, 57)),
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.height, color: Color(0xFF393839)),
                  ),
                ),
              ),
              const SizedBox(height: 26),

              Container(
                alignment: Alignment.center,
                child: SizedBox(
                  width: 300,
                  height: 45,
                  child: ElevatedButton(
                    onPressed: () async {
                      final age = int.tryParse(_ageController.text);
                      final weight = double.tryParse(_weightController.text);
                      final height = double.tryParse(_heightController.text);

                      if (age == null || weight == null || height == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Por favor, preencha todos os campos corretamente.')),
                        );
                        return;
                      }

                      final result = await AuthService().registerUser(
                        widget.name,
                        widget.email,
                        widget.password,
                        age,
                        _selectedGender,
                        weight,
                        height,
                      );

                      if (result) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Erro ao registrar o usuário.')),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF504EB4),
                    ),
                    child: const Text(
                      'Finalizar cadastro',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _ageController.dispose();
    _weightController.dispose();
    _heightController.dispose();
    super.dispose();
  }
}
