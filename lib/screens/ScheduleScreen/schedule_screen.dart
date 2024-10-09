import 'package:flutter/material.dart';
import '../../components/week_cards.dart';


class ScheduleScreen extends StatelessWidget {
  const ScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFF080E1C),
      body: Center(
        child: Column(
          children: [
            
            SizedBox(
              height: 200,
              child: WeekCards(),
            ),

            Text(
              'Planejamento do dia',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
