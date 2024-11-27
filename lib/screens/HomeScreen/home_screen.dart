import 'package:flutter/material.dart';
import '../../utils/string_utils.dart';
import 'package:provider/provider.dart';
import '../../store/user_store.dart';
import '../../components/homeViews/home_after_wake_time_set.dart';
import '../../components/homeViews/home_before_wake_time_set.dart';

class HomeScreen extends StatelessWidget {

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userStore = context.watch<UserStore>();
    final firstName = StringUtils.splitName(userStore.userName!)['firstName']!;

    return Scaffold(
      backgroundColor: const Color(0xFF080E1C),
      body: Padding(
        padding: const EdgeInsets.only(top: 30.0, left: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const SizedBox(height: 18),

            Text(
              'Bom dia, $firstName!',
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 8),

            const HomeBeforeWakeTimeSet()
          ],
        ),
      ),
    );
  }
}
