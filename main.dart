// Toàn bộ code cho file: lib/main.dart

import 'package:flutter/material.dart';
import 'screens/main_screen.dart'; // <-- Gọi file MainScreen của CHÚNG TA
import 'utils/localization.dart'; // <-- Gọi file ngôn ngữ

void main() {
  runApp(const MyApp());
}

// Lấy MyApp từ code của bạn bạn
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
      // KHÔNG dùng 'man_hinh_chinh', mà dùng 'MainScreen' của chúng ta
      // và truyền state ngôn ngữ vào
      home: MainScreen(ngonNgu: ngonNguHienTai, doiNgonNgu: doiNgonNgu),
    );
  }
}
