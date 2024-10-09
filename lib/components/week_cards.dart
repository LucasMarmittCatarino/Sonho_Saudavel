import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:carousel_slider/carousel_slider.dart';

class WeekCards extends StatefulWidget {
  const WeekCards({super.key});

  @override
  _WeekCardsState createState() => _WeekCardsState();
}

class _WeekCardsState extends State<WeekCards> {
  int selectedIndex = 3;

  @override
  Widget build(BuildContext context) {
    final DateTime today = DateTime.now();

    List<DateTime> weekDays = List.generate(7, (index) {
      return today.add(Duration(days: index - 3));
    });

    return Scaffold(
      backgroundColor: const Color(0xFF080E1C),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CarouselSlider.builder(
              itemCount: weekDays.length,
              itemBuilder: (context, index, realIndex) {
                final day = weekDays[index];
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  child: Container(
                    width: 80,
                    height: 80,
                    margin: const EdgeInsets.symmetric(horizontal: 8.0),
                    decoration: BoxDecoration(
                      color: selectedIndex == index 
                          ? const Color(0xFF7A88A5)
                          : const Color(0xFF151A2E),
                      shape: BoxShape.circle,
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0xFF7A88A5),
                          offset: Offset(0, 2),
                          blurRadius: 2,
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        DateFormat('dd').format(day),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                );
              },
              options: CarouselOptions(
                height: 120,
                enableInfiniteScroll: false,
                enlargeCenterPage: true,
                viewportFraction: 0.25,
                initialPage: selectedIndex,
                onPageChanged: (index, reason) {
                  setState(() {
                    selectedIndex = index;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
