
import 'package:flutter/material.dart';
import 'screens/main_screen.dart'; 
import 'utils/localization.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  NgonNgu ngonNguHienTai = NgonNgu.viet;

  void doiNgonNgu(NgonNgu nn) {
    setState(() {
      ngonNguHienTai = nn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: MainScreen(ngonNgu: ngonNguHienTai, doiNgonNgu: doiNgonNgu),
    );
  }
}

