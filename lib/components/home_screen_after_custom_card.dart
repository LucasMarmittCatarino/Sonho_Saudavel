import 'package:flutter/material.dart';

class HomeScreenAfterCustomCard extends StatefulWidget {
  final String label;

  const HomeScreenAfterCustomCard({
    super.key,
    required this.label,
  });

  @override
  _HomeScreenAfterCustomCardState createState() =>
      _HomeScreenAfterCustomCardState();
}

class _HomeScreenAfterCustomCardState extends State<HomeScreenAfterCustomCard> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    // Obtenha a largura da tela e subtraia 40 (20 de cada lado para margem)
    double screenWidth = MediaQuery.of(context).size.width;
    double containerWidth = screenWidth - 40; // 20 de margin em cada lado

    return Container(
      width: containerWidth, // Torna o container flexível
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
