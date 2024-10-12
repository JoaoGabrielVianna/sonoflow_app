import 'package:flutter/material.dart';
import 'package:sonoflow/presentation/view/dashboard_screen.dart';
import 'package:sonoflow/presentation/view/home_screen.dart';
import 'package:sonoflow/presentation/view/setting_screen.dart';

class AuthProvider extends StatefulWidget {
  const AuthProvider({super.key});

  @override
  State<AuthProvider> createState() => _AuthProviderState();
}

class _AuthProviderState extends State<AuthProvider> {
  // ===== INDEX VALUE TO SCREEN =====
  int _currentIndex = 1;

  // ===== LIST SCREEN TO ROUTE
  List<Widget> body = const [
    DashboardScreen(),
    HomeScreen(),
    SettingScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            color: Color.fromRGBO(12, 31, 61, 1),
            image: DecorationImage(
                image: AssetImage('assets/auth_background.png'),
                fit: BoxFit.cover)),
        child: Center(
          child: body[_currentIndex],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: const Color.fromRGBO(240, 208, 51, 1),
        currentIndex: _currentIndex,
        onTap: (int newIndex) {
          setState(() {
            _currentIndex = newIndex;
          });
        },
        items: <BottomNavigationBarItem>[
          // ===== DASHBOARD ICON =====
          BottomNavigationBarItem(
            icon: Image.asset('assets/icons/dashboard.png'),
            activeIcon: Image.asset('assets/icons/dashboard-active.png'),
            label: 'Dashboard',
          ),

          // ===== HOME ICON =====
          BottomNavigationBarItem(
            icon: Image.asset('assets/icons/home.png'),
            activeIcon: Image.asset('assets/icons/home-active.png'),
            label: 'Home',
          ),

          // ===== SETTINGS ICON =====
          BottomNavigationBarItem(
              icon: Image.asset('assets/icons/setting.png'),
              activeIcon: Image.asset('assets/icons/setting-active.png'),
              label: 'Configurações')
        ],
      ),
    );
  }
}