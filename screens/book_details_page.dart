// Toàn bộ code cho file: lib/screens/book_details_page.dart (ĐÃ SỬA)

import 'package:flutter/material.dart';
import '../utils/localization.dart'; // <-- THÊM IMPORT NÀY

class BookDetailsPage extends StatefulWidget {
  final String bookId;
  final NgonNgu ngonNgu; // <-- THÊM DÒNG NÀY

  const BookDetailsPage({
    Key? key,
    required this.bookId,
    required this.ngonNgu, // <-- THÊM DÒNG NÀY
  }) : super(key: key);

  @override
  State<BookDetailsPage> createState() => _BookDetailsPageState();
}

class _BookDetailsPageState extends State<BookDetailsPage> {
  bool _isLoading = true;
  Map<String, String>? _bookDetails;

  @override
  void initState() {
    super.initState();
    _fetchBookDetails();
  }

  Future<void> _fetchBookDetails() async {
    print('Đang tải chi tiết cho sách ID: ${widget.bookId}');
    await Future.delayed(const Duration(seconds: 1)); // Giả lập tải

    // SỬA Ở ĐÂY: Dùng dữ liệu giả lập với đường dẫn ảnh local
    setState(() {
      _bookDetails = {
        'title': 'Đắc Nhân Tâm',
        'author': 'Dale Carnegie',
        // SỬA QUAN TRỌNG: Dùng ảnh local
        'imageUrl': 'assets/images/dac_nhan_tam.jpg',
        'description':
            'Đây là cuốn sách self-help nổi tiếng nhất của Dale Carnegie...',
      };
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_isLoading ? 'Đang tải...' : _bookDetails!['title']!),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // SỬA QUAN TRỌNG: Đổi Image.network thành Image.asset
                      Image.asset(
                        _bookDetails!['imageUrl']!,
                        width: 130,
                        height: 200,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            // Hiển thị lỗi nếu không tìm thấy asset
                            height: 200,
                            width: 130,
                            color: Colors.grey[200],
                            child: const Icon(Icons.error, color: Colors.red),
                          );
                        },
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              _bookDetails!['title']!,
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Tác giả: ${_bookDetails!['author']!}',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () {
                      /* Xử lý đọc sách */
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 48),
                    ),
                    // Tạm hardcode, bạn có thể thêm vào class Strings
                    child: const Text('Bắt đầu đọc'),
                  ),
                  const SizedBox(height: 8),
                  OutlinedButton(
                    onPressed: () {
                      /* Xử lý thêm vào thư viện */
                    },
                    style: OutlinedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 48),
                    ),
                    // Tạm hardcode, bạn có thể thêm vào class Strings
                    child: const Text('Thêm vào thư viện'),
                  ),
                  const SizedBox(height: 24),
                  Text('Mô tả', style: Theme.of(context).textTheme.titleLarge),
                  const SizedBox(height: 8),
                  Text(
                    _bookDetails!['description']!,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
    );
  }
}
