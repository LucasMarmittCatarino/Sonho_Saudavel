import 'package:flutter/material.dart';

class ScheduleCustomCard extends StatefulWidget {
  final String label;
  final String time;

  const ScheduleCustomCard({
    super.key,
    required this.label,
    required this.time,
  });

  @override
  _ScheduleCustomCardState createState() => _ScheduleCustomCardState();
}

class _ScheduleCustomCardState extends State<ScheduleCustomCard> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      height: 70,
      decoration: BoxDecoration(
        color: const Color(0xFF151A2E),
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
            color: Color(0xFF7A88A5),
            offset: Offset(0, 4),
            spreadRadius: -1,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.label,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w200,
                    color: Color(0xFFBEBFC5),
                  ),
                ),
                Text(
                  widget.time,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            Switch(
              value: isSwitched,
              onChanged: (value) {
                setState(() {
                  isSwitched = value;
                });
              },
              activeColor: Color(0xFF7A88A5),
              inactiveThumbColor: Colors.white,
              inactiveTrackColor: Color(0xFF151A2E),
            ),
          ],
        ),
      ),
    );
  }
}
