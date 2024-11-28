import 'package:flutter/material.dart';
import '../home_screen_custom_card.dart';
import '../../utils/calculate_bed_time.dart';
import '../../components/home_screen_after_custom_card.dart';

class HomeAfterWakeTimeSet extends StatefulWidget {
  final String wakeUpTime;
  final int sleepTimeAmount;

  const HomeAfterWakeTimeSet({
    super.key,
    required this.wakeUpTime,
    required this.sleepTimeAmount,
  });

  @override
  _HomeAfterWakeTimeSetState createState() => _HomeAfterWakeTimeSetState();
}

class _HomeAfterWakeTimeSetState extends State<HomeAfterWakeTimeSet> {
  bool _isSwitchOn = false;

  @override
  Widget build(BuildContext context) {
    final bedTime = calculateBedTime(widget.wakeUpTime, widget.sleepTimeAmount);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),

        Text(
          'Com base nas suas informações, seu tempo ideal de sono é de ${widget.sleepTimeAmount} horas.',
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
        ),

        const SizedBox(height: 30),

        // Análise do sono
        const Text(
          'Recomendação de cronograma:',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),

        const SizedBox(height: 30),

        // Cards com informações de sono
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            HomeScreenCustomCard(
              label: 'Deitar-se:',
              time: bedTime,
              icon: Icons.hotel,
            ),
            HomeScreenCustomCard(
              label: 'Acordar:',
              time: widget.wakeUpTime,
              icon: Icons.alarm,
            ),
          ],
        ),

        const SizedBox(height: 30),

        // Switch com explicação
        HomeScreenAfterCustomCard(label: 'Ativar Alarme Sugerido?')
      ],
    );
  }
}
