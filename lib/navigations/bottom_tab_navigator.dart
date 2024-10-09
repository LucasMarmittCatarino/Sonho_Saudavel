import 'package:flutter/material.dart';
import '../screens/HomeScreen/home_screen.dart';
import '../screens/ScheduleScreen/schedule_screen.dart';
import '../screens/AlarmScreen/alarm_screen.dart';
import '../screens/ProfileScreen/profile_screen.dart';

class BottomTabNavigator extends StatefulWidget {
  const BottomTabNavigator({super.key});

  @override
  _BottomTabNavigatorState createState() => _BottomTabNavigatorState();
}

class _BottomTabNavigatorState extends State<BottomTabNavigator> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const ScheduleScreen(),
    const AlarmScreen(),
    const ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF080E1C),
      body: IndexedStack(
        index: _selectedIndex,
        children: _screens,
      ),
      bottomNavigationBar: Container(
        height: 76,
        decoration: const BoxDecoration(
          color: Color(0xFF151A2E),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: BottomNavigationBar(
                currentIndex: _selectedIndex,
                onTap: _onItemTapped,
                backgroundColor: const Color.fromARGB(110, 21, 26, 46),
                selectedItemColor: Colors.white,
                unselectedItemColor: const Color(0xFF5b6a8a),
                type: BottomNavigationBarType.fixed,
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.insights),
                    label: 'Agendar',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.nights_stay),
                    label: 'Alarme',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person),
                    label: 'Perfil',
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 70,
              left: (_selectedIndex * (MediaQuery.of(context).size.width / 4)) + (MediaQuery.of(context).size.width / 8) - 25,
              child: Container(
                width: 50,
                height: 4,
                decoration: BoxDecoration(
                  color: const Color(0xFF7A88A5),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
