import 'package:flutter/material.dart';
import '../../components/week_cards.dart';
import '../../components/schedule_custom_card.dart';


class ScheduleScreen extends StatelessWidget {
  const ScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            ),

            SizedBox(height: 40,),

            Expanded(
              child: Column(
                children: [
                  Column(
                    children: [
                      ScheduleCustomCard(
                        label: 'Dormir', 
                        time: '22:30 pm',
                      ),

                      SizedBox(height: 30,),

                      ScheduleCustomCard(
                        label: 'Estudar', 
                        time: '19:30 pm',
                      ),

                      SizedBox(height: 30,),

                      ScheduleCustomCard(
                        label: 'Trabalhar', 
                        time: '7:00 am',
                      ),
                    ],
                  ),

                  Container(
                      margin: const EdgeInsets.only(top: 50),
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        color: Color(0xFF151A2E),
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFF7A88A5),
                            offset: Offset(0, 0),
                            blurRadius: 5,
                          ),
                        ],
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          
                        },
                        style: ElevatedButton.styleFrom(
                          shape: CircleBorder(),
                          padding: EdgeInsets.all(0),
                          backgroundColor: Colors.transparent,
                        ),
                        child: Icon(
                          Icons.add,
                          size: 25,
                          color: Colors.white,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
