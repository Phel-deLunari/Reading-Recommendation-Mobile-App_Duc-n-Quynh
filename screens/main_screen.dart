// Toàn bộ code cho file: lib/screens/main_screen.dart

import 'package:flutter/material.dart';
import '../utils/localization.dart'; // <-- Import ngôn ngữ

// Import tất cả các trang
import 'home_page.dart';
import 'category_page.dart';
import 'library_page.dart';
import 'profile_page.dart';

class MainScreen extends StatefulWidget {
  // 1. Nhận state ngôn ngữ từ main.dart
  final NgonNgu ngonNgu;
  final Function(NgonNgu) doiNgonNgu;

  const MainScreen({Key? key, required this.ngonNgu, required this.doiNgonNgu})
    : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // 2. Tạo danh sách các trang và TRUYỀN state ngôn ngữ xuống
    final List<Widget> _widgetOptions = <Widget>[
      HomePage(ngonNgu: widget.ngonNgu), // Truyền
      CategoryPage(ngonNgu: widget.ngonNgu), // Truyền
      LibraryPage(ngonNgu: widget.ngonNgu), // Truyền
      ProfilePage(
        ngonNgu: widget.ngonNgu,
        doiNgonNgu: widget.doiNgonNgu,
      ), // Truyền
    ];

    return Scaffold(
      body: Center(
        child: IndexedStack(index: _selectedIndex, children: _widgetOptions),
      ),
      bottomNavigationBar: BottomNavigationBar(
        // 3. Dùng class Strings để dịch các label
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            label: Strings.get(StringsEnum.trangChu, widget.ngonNgu),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.category),
            label: Strings.get(StringsEnum.danhMuc, widget.ngonNgu),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.book),
            label: Strings.get(StringsEnum.thuVien, widget.ngonNgu),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.person),
            label: Strings.get(StringsEnum.thongTin, widget.ngonNgu),
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}
