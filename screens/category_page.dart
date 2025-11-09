// Toàn bộ code cho file: lib/screens/category_page.dart

import 'package:flutter/material.dart';
import '../utils/localization.dart'; // <-- THÊM

class CategoryPage extends StatelessWidget {
  final NgonNgu ngonNgu; // <-- THÊM
  const CategoryPage({Key? key, required this.ngonNgu})
    : super(key: key); // <-- THÊM

  static const List<String> _categories = [
    'Văn học',
    'Kinh tế',
    'Self-help',
    'Lịch sử',
    'Khoa học',
    'Thiếu nhi',
    'Tâm lý',
    'Tiểu thuyết',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.get(StringsEnum.danhMuc, ngonNgu)), // <-- SỬA
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // 2 cột
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
          childAspectRatio: 3 / 1,
        ),
        itemCount: _categories.length,
        itemBuilder: (context, index) {
          final category = _categories[index];
          return InkWell(
            onTap: () {
              print('Đã chọn: $category');
            },
            child: Card(
              color: Theme.of(context).colorScheme.primaryContainer,
              child: Center(
                child: Text(
                  category,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
