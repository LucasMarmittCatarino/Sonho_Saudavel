import 'package:flutter/material.dart';
import '../screens/HomeScreen/home_screen.dart';
import '../screens/AlarmScreen/alarm_screen.dart';
import '../screens/ProfileScreen/profile_screen.dart';
import '../screens/ScheduleScreen/schedule_screen.dart';
import '../services/firestore_service.dart';

class BottomTabNavigator extends StatefulWidget {
  final String userEmail;

  const BottomTabNavigator({super.key, required this.userEmail});

  @override
  _BottomTabNavigatorState createState() => _BottomTabNavigatorState();
}

class _BottomTabNavigatorState extends State<BottomTabNavigator> {
  int _selectedIndex = 0;
  String _userName = 'Usuário'; // Valor inicial padrão
  final FirestoreService _firestoreService = FirestoreService(); // Instância do serviço

  late List<Widget> _screens;
  bool _isLoading = true; // Indica se o carregamento está em andamento

  @override
  void initState() {
    super.initState();
    _initializeUserName(); // Inicializa o nome do usuário
  }

  Future<void> _initializeUserName() async {
    try {
      final userName = await _firestoreService.fetchUserNameByEmail(widget.userEmail);
      setState(() {
        _userName = userName;
        _initializeScreens(); // Inicializa as telas após obter o nome
        _isLoading = false;  // Carregamento concluído
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Erro ao buscar o nome do usuário')),
      );
      setState(() {
        _isLoading = false; // Carregamento falhou, mas precisamos exibir algo
      });
    }
  }

  void _initializeScreens() {
    _screens = [
      HomeScreen(userName: _userName),
      const ScheduleScreen(),
      const AlarmScreen(),
      ProfileScreen(userEmail: widget.userEmail),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  double _getIndicatorPosition() {
  return (_selectedIndex * (MediaQuery.of(context).size.width / 4)) +
      (MediaQuery.of(context).size.width / 8) -
      (7 + _selectedIndex * 13);
  }

  BottomNavigationBarItem _buildBottomNavigationBarItem(IconData icon, String label) {
    return BottomNavigationBarItem(
      icon: Padding(
        padding: const EdgeInsets.only(bottom: 4.0),
        child: Icon(icon),
      ),
      label: label,
      backgroundColor: Colors.transparent,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF080E1C),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : IndexedStack(
              index: _selectedIndex,
              children: _screens,
            ),
      bottomNavigationBar: Theme(
        data: ThemeData(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: Container(
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
              BottomNavigationBar(
                currentIndex: _selectedIndex,
                onTap: _onItemTapped,
                selectedItemColor: Colors.white,
                unselectedItemColor: const Color(0xFF5b6a8a),
                type: BottomNavigationBarType.shifting,
                items: [
                  _buildBottomNavigationBarItem(Icons.home, 'Home'),
                  _buildBottomNavigationBarItem(Icons.calendar_month, 'Agendar'),
                  _buildBottomNavigationBarItem(Icons.nights_stay, 'Alarme'),
                  _buildBottomNavigationBarItem(Icons.person, 'Perfil'),
                ],
                showUnselectedLabels: false,
              ),
                            AnimatedPositioned(
                duration: const Duration(milliseconds: 70),
                bottom: 72,
                left: _getIndicatorPosition(),
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
      ),
    );
  }
}
