import 'package:flutter/material.dart';
import '../../services/firestore_service.dart';
import 'login_screen.dart';
import 'package:flutter/services.dart';

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
  final FirestoreService _firestoreService = FirestoreService();

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

              // Campos de entrada
              SizedBox(
                width: 300,
                child: TextField(
                  controller: _ageController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly, // Permite apenas números
                  ],
                  decoration: const InputDecoration(
                    labelText: 'Idade',
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
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.person, color: Color(0xFF393839)),
                  ),
                ),
              ),
              const SizedBox(height: 26),

              // Peso - Permite apenas números e adiciona ponto após os dois primeiros dígitos
              SizedBox(
                width: 300,
                child: TextField(
                  controller: _weightController,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  inputFormatters: [
                    _WeightInputFormatter(),
                  ],
                  decoration: const InputDecoration(
                    labelText: 'Peso (kg)',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.fitness_center, color: Color(0xFF393839)),
                  ),
                ),
              ),
              const SizedBox(height: 26),

              // Altura - Apenas números inteiros, sem ponto
              SizedBox(
                width: 300,
                child: TextField(
                  controller: _heightController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly, // Permite apenas números
                  ],
                  decoration: const InputDecoration(
                    labelText: 'Altura (cm)',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.height, color: Color(0xFF393839)),
                  ),
                ),
              ),
              const SizedBox(height: 26),

              // Botão para finalizar cadastro
              SizedBox(
                width: 300,
                height: 45,
                child: ElevatedButton(
                  onPressed: () async {
                    final age = int.tryParse(_ageController.text);
                    final weight = double.tryParse(_weightController.text);
                    final height = int.tryParse(_heightController.text);

                    if (age == null || weight == null || height == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Por favor, preencha todos os campos corretamente.')),
                      );
                      return;
                    }

                    // Salva os dados no Firestore
                    try {
                      await _firestoreService.addUser(
                        name: widget.name,
                        email: widget.email,
                        password: widget.password,
                        age: age,
                        gender: _selectedGender,
                        weight: weight,
                        height: height,
                      );

                      // Navega para a tela de login após salvar
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const LoginScreen()),
                      );
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Erro ao salvar os dados.')),
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

// Custom Input Formatter para o Peso (adiciona ponto após os dois primeiros dígitos)
class _WeightInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    // Remove qualquer caractere não numérico
    String newText = newValue.text.replaceAll(RegExp(r'[^0-9]'), '');

    if (newText.isNotEmpty && newText.length > 2) {
      // Insere o ponto após os dois primeiros dígitos (como "90.5" ao invés de "9.50")
      newText = newText.substring(0, newText.length - 1) + '.' + newText.substring(newText.length - 1);
    }

    return TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}
