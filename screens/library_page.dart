
import 'package:flutter/material.dart';
import '../utils/localization.dart';

class LibraryPage extends StatelessWidget {
  final NgonNgu ngonNgu;
  const LibraryPage({super.key, required this.ngonNgu});

  @override
  Widget build(BuildContext context) {
    final danhSachSach = [
      'Nhà giả kim - Paulo Coelho',
      'Đắc nhân tâm - Dale Carnegie',
      'Tuổi trẻ đáng giá bao nhiêu - Rosie Nguyễn',
      'Bước Chậm Lại Giữa Thế Gian Vội Vã - Hae Min',
      'Tư Duy Nhanh và Chậm - Daniel Kahneman',
    ];

    return Material(
      child: Scaffold(
        appBar: AppBar(title: Text(Strings.get(StringsEnum.thuVien, ngonNgu))),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: ListView.builder(
            itemCount: danhSachSach.length,
            itemBuilder: (context, index) => Card(
              elevation: 3,
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: ListTile(
                leading: const Icon(Icons.book, color: Colors.teal),
                title: Text(danhSachSach[index]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

