
import 'package:flutter/material.dart';
import '../utils/localization.dart'; 

import 'home_page.dart';
import 'category_page.dart';
import 'library_page.dart';
import 'profile_page.dart';

class MainScreen extends StatefulWidget {
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
    final List<Widget> _widgetOptions = <Widget>[
      HomePage(ngonNgu: widget.ngonNgu), 
      CategoryPage(ngonNgu: widget.ngonNgu), 
      LibraryPage(ngonNgu: widget.ngonNgu),
      ProfilePage(
        ngonNgu: widget.ngonNgu,
        doiNgonNgu: widget.doiNgonNgu,
      ), 
    ];

    return Scaffold(
      body: Center(
        child: IndexedStack(index: _selectedIndex, children: _widgetOptions),
      ),
      bottomNavigationBar: BottomNavigationBar(
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

