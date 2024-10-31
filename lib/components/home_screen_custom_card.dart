import 'package:flutter/material.dart';

class HomeScreenCustomCard extends StatelessWidget {
  final String label;
  final String time;
  final IconData icon;

  const HomeScreenCustomCard({
    super.key,
    required this.label,
    required this.time,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Container(
        width: 195,
        height: 100,
        decoration: BoxDecoration(
          color: const Color(0xFF151A2E),
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [
            BoxShadow(
              color: Color(0xFF7A88A5),
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w200, color: Color(0xFFBEBFC5)),
                ),
                Text(
                  time,
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ],
            ),
            const SizedBox(width: 20),
            Icon(icon, color: Colors.white, size: 40),
          ],
        ),
      ),
    );
  }
}
