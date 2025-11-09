
import 'package:flutter/material.dart';
import 'settings_page.dart'; 
import '../utils/localization.dart';
import '../utils/navigation.dart'; 

class ProfilePage extends StatelessWidget {
  final NgonNgu ngonNgu;
  final Function(NgonNgu) doiNgonNgu; 

  const ProfilePage({
    super.key,
    required this.ngonNgu,
    required this.doiNgonNgu,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.get(StringsEnum.thongTin, ngonNgu)),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              hien_thi_man_hinh(
                context,
                SettingsPage(ngonNgu: ngonNgu, doiNgonNgu: doiNgonNgu),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.account_circle,
              size: 80,
              color: Colors.blueAccent,
            ),
            const SizedBox(height: 10),
            const Text(
              'Vũ Mai Quỳnh',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            const Text('📧 23010223@st.phenikaa-uni.edu.vn'),
            const SizedBox(height: 5),
            const Text(
              '💡 Phát triển: Giao diện thư viện của tôi, thông tin cá nhân, cài đặt',
            ),

            const Icon(
              Icons.account_circle,
              size: 80,
              color: Colors.blueAccent,
            ),
            const SizedBox(height: 10),
            const Text(
              'Nguyễn Minh Đức',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            const Text('📧 23010171@st.phenikaa-uni.edu.vn'),
            const SizedBox(height: 5),
            const Text(
              '💡 Phát triển: Giao diện trang chủ, chi tiết sách, danh mục sách',
            ),
          ],
        ),
      ),
    );
  }
}

