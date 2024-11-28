import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../store/user_store.dart';
import '../../services/firestore_service.dart';

class AlarmScreen extends StatefulWidget {
  const AlarmScreen({super.key});

  @override
  _AlarmScreenState createState() => _AlarmScreenState();
}

class _AlarmScreenState extends State<AlarmScreen> {
  TimeOfDay _selectedTime = TimeOfDay.now();
  final FirestoreService _firestoreService = FirestoreService();

  Future<void> _selectTime(BuildContext context) async {
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

  Future<void> _updateWakeUpTime(BuildContext context) async {
    final userStore = context.read<UserStore>();
    final sleepSchedule = userStore.sleepSchedule ?? {};

    // Formata o horário selecionado para uma string no formato HH:mm
    final wakeUpTime = _selectedTime.format(context);

    sleepSchedule['wakeUpTime'] = wakeUpTime;
    userStore.setUser(
      name: userStore.userName!,
      email: userStore.userEmail!,
      password: userStore.password!,
      age: userStore.age!,
      gender: userStore.gender!,
      weight: userStore.weight!,
      height: userStore.height!,
      sleepSchedule: sleepSchedule,
    );

    try {
      // Atualiza os dados no Firestore usando o serviço
      await _firestoreService.updateUser(userStore.userEmail!, {
        'sleepSchedule': sleepSchedule,
      });

      // Mostra um snackbar de sucesso
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Horário salvo com sucesso!')),
      );
    } catch (error) {
      // Mostra um snackbar de erro
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro ao salvar: $error')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xFF080E1C),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 20.0),
          child: Center(
            child: Column(
              children: [
                const Text(
                  'A que horas você pretende acordar?',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
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
                      width: 70,
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
                      width: 70,
                      height: 2,
                      color: Colors.white,
                    ),
                  ],
                ),
                const SizedBox(height: 50),
                SizedBox(
                  width: 300,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () => _updateWakeUpTime(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF151A2E),
                    ),
                    child: const Text(
                      'Definir alarme',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
