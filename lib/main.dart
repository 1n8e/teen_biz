import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/register_screen.dart';
import 'screens/safety_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/search_screen.dart';
import 'screens/order_screen.dart';
import 'screens/faq_screen.dart';
import 'screens/policy_screen.dart';
import 'screens/settings_screen.dart';
import 'theme.dart';
import 'theme_notifier.dart';

void main() {
  runApp(const TeenBizApp());
}

class TeenBizApp extends StatelessWidget {
  const TeenBizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeNotifier,
      builder: (context, mode, _) {
        return MaterialApp(
          title: 'TeenBiz',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: mode,
          initialRoute: '/',
          routes: {
            '/': (context) => const HomeScreen(),
            '/register': (context) => const RegisterScreen(),
            '/safety': (context) => const SafetyScreen(),
            '/profile': (context) => const ProfileScreen(),
            '/search': (context) => const SearchScreen(),
            '/order': (context) => const OrderScreen(),
            '/faq': (context) => const FaqScreen(),
            '/policy': (context) => const PolicyScreen(),
            '/settings': (context) => const SettingsScreen(),
          },
        );
      },
    );
  }
}
