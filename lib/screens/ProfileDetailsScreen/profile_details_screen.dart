import 'package:flutter/material.dart';
import '../../services/firestore_service.dart';

class ProfileDetailsScreen extends StatefulWidget {
  final String userEmail;
  const ProfileDetailsScreen({super.key, required this.userEmail});

  @override
  _ProfileDetailsScreenState createState() => _ProfileDetailsScreenState();
}

class _ProfileDetailsScreenState extends State<ProfileDetailsScreen> {
  final FirestoreService _firestoreService = FirestoreService();

  late TextEditingController nameController;
  late TextEditingController ageController;
  late TextEditingController weightController;
  late TextEditingController heightController;
  String selectedGender = 'Masculino';

  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    try {
      final userData = await _firestoreService.getUserByEmail(widget.userEmail);
      if (userData != null) {
        setState(() {
          nameController = TextEditingController(text: userData['name']);
          ageController = TextEditingController(text: userData['age'].toString());
          weightController = TextEditingController(text: userData['weight'].toString());
          heightController = TextEditingController(text: userData['height'].toString());
          selectedGender = userData['sex'] ?? 'Masculino';
          isLoading = false;
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Usuário não encontrado')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Erro ao carregar os dados do usuário')),
      );
    }
  }

  Future<void> _saveUserData() async {
    try {
      final updatedData = {
        'name': nameController.text,
        'age': int.parse(ageController.text),
        'weight': double.parse(weightController.text),
        'height': int.parse(heightController.text),
        'sex': selectedGender,
      };

      await _firestoreService.updateUser(widget.userEmail, updatedData);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Informações atualizadas com sucesso')),
      );
      Navigator.pop(context);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Erro ao salvar as informações')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          'Detalhe do perfil',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      backgroundColor: const Color(0xFF080E1C),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: nameController,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  labelText: 'Nome',
                  labelStyle: TextStyle(color: Colors.grey),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
              ),
              TextField(
                controller: ageController,
                keyboardType: TextInputType.number,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  labelText: 'Idade',
                  labelStyle: TextStyle(color: Colors.grey),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
              ),
              DropdownButtonFormField<String>(
                value: selectedGender,
                dropdownColor: const Color(0xFF080E1C),
                style: const TextStyle(color: Colors.white),
                items: ['Masculino', 'Feminino', 'Outro']
                    .map((gender) => DropdownMenuItem(
                          value: gender,
                          child: Text(gender),
                        ))
                    .toList(),
                decoration: const InputDecoration(
                  labelText: 'Sexo',
                  labelStyle: TextStyle(color: Colors.grey),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
                onChanged: (value) {
                  selectedGender = value!;
                },
              ),
              TextField(
                controller: weightController,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  labelText: 'Peso (kg)',
                  labelStyle: TextStyle(color: Colors.grey),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
              ),
              TextField(
                controller: heightController,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  labelText: 'Altura (cm)',
                  labelStyle: TextStyle(color: Colors.grey),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              Center(
                child: ElevatedButton(
                  style: TextButton.styleFrom(
                    backgroundColor: const Color(0xFF141B2E),
                  ),
                  onPressed: _saveUserData,
                  child: const Text(
                    'Salvar Informações',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
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
}
