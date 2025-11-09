// Toàn bộ code cho file: lib/widgets/book_card.dart (ĐÃ SỬA)

import 'package:flutter/material.dart';

class BookCard extends StatelessWidget {
  final String title;
  final String imageUrl; // Bây giờ đây là đường dẫn asset
  final VoidCallback onTap;

  const BookCard({
    Key? key,
    required this.title,
    required this.imageUrl,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Container(
          width: 130,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(4.0),
                ),

                // THAY ĐỔI CHÍNH Ở ĐÂY
                child: Image.asset(
                  // <-- Sửa từ Image.network
                  imageUrl, // Dùng đường dẫn asset 'assets/images/...'
                  height: 160,
                  width: 130,
                  fit: BoxFit.cover,

                  // Báo lỗi nếu không tìm thấy asset
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 160,
                      width: 130,
                      color: Colors.grey[200],
                      child: const Icon(Icons.error, color: Colors.red),
                    );
                  },
                ),
                // Chúng ta không cần 'loadingBuilder' nữa
                // vì ảnh asset tải lên ngay lập tức
              ),

              // Tên sách (giữ nguyên)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
