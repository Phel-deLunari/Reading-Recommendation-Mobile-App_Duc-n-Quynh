// Toàn bộ code cho file: lib/screens/home_page.dart
import 'package:flutter/material.dart';
import '../widgets/book_card.dart';
import 'book_details_page.dart';
import '../utils/localization.dart'; // Import file ngôn ngữ

class HomePage extends StatelessWidget {
  final NgonNgu ngonNgu; // Nhận ngôn ngữ

  // Bỏ 'const' vì _popularBooks là 'final'
  HomePage({Key? key, required this.ngonNgu}) : super(key: key);

  // Dùng ảnh local assets
  final List<Map<String, String>> _popularBooks = [
    {
      'id': '1',
      'title': 'Đắc Nhân Tâm',
      'imageUrl': 'assets/images/dac_nhan_tam.jpg', // Đường dẫn local
    },
    {
      'id': '2',
      'title': 'Nhà Giả Kim',
      'imageUrl': 'assets/images/nha_gia_kim.jpg', // Đường dẫn local
    },
    // Bạn có thể thêm sách khác ở đây
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Dùng class Strings để dịch tiêu đề
        title: Text(Strings.get(StringsEnum.trangChu, ngonNgu)),
      ),
      body: ListView(
        children: [
          // Truyền 'context' vào hàm
          _buildBookSection(
            context,
            title: 'Sách phổ biến',
            books: _popularBooks,
          ),
          _buildBookSection(
            context,
            title: 'Gợi ý cho bạn',
            books: _popularBooks.reversed.toList(),
          ),
        ],
      ),
    );
  }

  // Hàm này phải nhận 'BuildContext context'
  Widget _buildBookSection(
    BuildContext context, {
    required String title,
    required List<Map<String, String>> books,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, // Sửa lỗi typo
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
          child: Text(title, style: Theme.of(context).textTheme.headlineSmall),
        ),
        SizedBox(
          height: 250,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            itemCount: books.length,
            itemBuilder: (context, index) {
              // 'context' này là của Builder
              final book = books[index];

              return BookCard(
                title: book['title']!,
                imageUrl: book['imageUrl']!,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BookDetailsPage(
                        bookId: book['id']!,
                        ngonNgu: ngonNgu, // Truyền ngôn ngữ sang trang Chi tiết
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
