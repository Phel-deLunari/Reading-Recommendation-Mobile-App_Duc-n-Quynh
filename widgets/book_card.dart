
import 'package:flutter/material.dart';

class BookCard extends StatelessWidget {
  final String title;
  final String imageUrl; 
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

                child: Image.asset(
                  imageUrl, 
                  height: 160,
                  width: 130,
                  fit: BoxFit.cover,

                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 160,
                      width: 130,
                      color: Colors.grey[200],
                      child: const Icon(Icons.error, color: Colors.red),
                    );
                  },
                ),
              ),

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

