import 'package:flutter/material.dart';
import '../../navigations/bottom_tab_navigator.dart';

class HomeBeforeWakeTimeSet extends StatelessWidget {
  const HomeBeforeWakeTimeSet({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: double.infinity, // Largura de 100% da tela
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center, // Centraliza os itens
          children: [
            const SizedBox(height: 50),
            // Texto do tempo ideal de sono
            const Padding(
              padding: EdgeInsets.only(right: 20),
              child: Text(
                'Para que possamos calcular o horário ideal para você dormir, é necessário que defina o horário que deseja acordar.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 30),
            const Padding(
              padding: EdgeInsets.only(right: 20),
              child: Text(
                'Isso nos permitirá fornecer recomendações precisas com base nas suas necessidades de sono.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    // Altera o índice do BottomTabNavigator para o índice da AlarmScreen
                    final bottomTabNavigatorState = context.findAncestorStateOfType<BottomTabNavigatorState>();
                    if (bottomTabNavigatorState != null) {
                      bottomTabNavigatorState.onItemTapped(2);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF151A2E),
                  ),
                  child: const Text(
                    'Definir hora de acordar',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
