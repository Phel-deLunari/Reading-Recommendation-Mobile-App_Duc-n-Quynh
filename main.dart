import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

enum NgonNgu { viet, anh }

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
      home: man_hinh_chinh(ngonNgu: ngonNguHienTai, doiNgonNgu: doiNgonNgu),
    );
  }
}

class Strings {
  static String get(StringsEnum key, NgonNgu nn) {
    switch (key) {
      case StringsEnum.appTitle:
        return nn == NgonNgu.viet ? '📚 Thư viện sách' : '📚 Book library App';
      case StringsEnum.thuVien:
        return nn == NgonNgu.viet ? 'Thư viện của tôi' : 'My Library';
      case StringsEnum.caiDat:
        return nn == NgonNgu.viet ? 'Cài đặt' : 'Settings';
      case StringsEnum.thongTin:
        return nn == NgonNgu.viet ? 'Thông tin cá nhân' : 'Profile';
      case StringsEnum.quayLai:
        return nn == NgonNgu.viet ? 'Quay lại' : 'Back';
      case StringsEnum.veManHinhChinh:
        return nn == NgonNgu.viet ? 'Về màn hình chính' : 'Home';
      case StringsEnum.gioiThieuCaiDat:
        return nn == NgonNgu.viet ? 'Tùy chỉnh ngôn ngữ' : 'Customize language';
    }
  }
}

enum StringsEnum {
  appTitle,
  thuVien,
  caiDat,
  thongTin,
  quayLai,
  veManHinhChinh,
  gioiThieuCaiDat,
}

class man_hinh_chinh extends StatelessWidget {
  final NgonNgu ngonNgu;
  final Function(NgonNgu) doiNgonNgu;

  const man_hinh_chinh({
    super.key,
    required this.ngonNgu,
    required this.doiNgonNgu,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.teal[50],
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              Strings.get(StringsEnum.appTitle, ngonNgu),
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 25),
            ElevatedButton(
              onPressed: () {
                hien_thi_man_hinh(context, Thu_vien_cua_toi(ngonNgu: ngonNgu));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal[40],
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 12,
                ),
              ),
              child: Text(Strings.get(StringsEnum.thuVien, ngonNgu)),
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {
                hien_thi_man_hinh(
                  context,
                  Cai_dat(ngonNgu: ngonNgu, doiNgonNgu: doiNgonNgu),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orangeAccent,
                padding: const EdgeInsets.symmetric(
                  horizontal: 60,
                  vertical: 12,
                ),
              ),
              child: Text(Strings.get(StringsEnum.caiDat, ngonNgu)),
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {
                hien_thi_man_hinh(
                  context,
                  Thong_tin_nguoi_dung(ngonNgu: ngonNgu),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightBlue,
                padding: const EdgeInsets.symmetric(
                  horizontal: 45,
                  vertical: 12,
                ),
              ),
              child: Text(Strings.get(StringsEnum.thongTin, ngonNgu)),
            ),
          ],
        ),
      ),
    );
  }
}

void hien_thi_man_hinh(BuildContext context, Widget manHinh) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => manHinh));
}

void quay_ve_man_hinh_truoc(BuildContext context) {
  Navigator.pop(context);
}

void quay_ve_man_hinh_chinh(BuildContext context) {
  Navigator.popUntil(context, (route) => route.isFirst);
}

class Cai_dat extends StatelessWidget {
  final NgonNgu ngonNgu;
  final Function(NgonNgu) doiNgonNgu;

  const Cai_dat({super.key, required this.ngonNgu, required this.doiNgonNgu});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '⚙️ ${Strings.get(StringsEnum.caiDat, ngonNgu)}',
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            const Text('🌐 Chọn ngôn ngữ / Choose Language:'),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => doiNgonNgu(NgonNgu.viet),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ngonNgu == NgonNgu.viet
                        ? Colors.tealAccent
                        : const Color.fromARGB(240, 202, 199, 199),
                  ),
                  child: const Text('Tiếng Việt'),
                ),
                const SizedBox(width: 15),
                ElevatedButton(
                  onPressed: () => doiNgonNgu(NgonNgu.anh),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ngonNgu == NgonNgu.anh
                        ? Colors.blue
                        : const Color.fromARGB(255, 202, 195, 195),
                  ),
                  child: const Text('English'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              Strings.get(StringsEnum.gioiThieuCaiDat, ngonNgu),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            CustomButton(
              label: Strings.get(StringsEnum.quayLai, ngonNgu),
              color: const Color.fromARGB(255, 196, 194, 194),
              onPressed: () => quay_ve_man_hinh_truoc(context),
              icon: Icons.arrow_back,
            ),
          ],
        ),
      ),
    );
  }
}

class Thong_tin_nguoi_dung extends StatelessWidget {
  final NgonNgu ngonNgu;
  const Thong_tin_nguoi_dung({super.key, required this.ngonNgu});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Center(
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
            const Text('💡 Sở thích: Đọc sách, nghe nhạc, chơi game'),
            const SizedBox(height: 20),
            CustomButton(
              label: Strings.get(StringsEnum.quayLai, ngonNgu),
              color: Colors.grey,
              onPressed: () => quay_ve_man_hinh_truoc(context),
              icon: Icons.arrow_back,
            ),
            const SizedBox(height: 10),
            CustomButton(
              label: Strings.get(StringsEnum.veManHinhChinh, ngonNgu),
              color: Colors.blueAccent,
              onPressed: () => quay_ve_man_hinh_chinh(context),
              icon: Icons.home,
            ),
          ],
        ),
      ),
    );
  }
}

class Thu_vien_cua_toi extends StatelessWidget {
  final NgonNgu ngonNgu;
  const Thu_vien_cua_toi({super.key, required this.ngonNgu});

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
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              '📖 ${Strings.get(StringsEnum.thuVien, ngonNgu)}',
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Expanded(
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
            const SizedBox(height: 15),
            CustomButton(
              label: Strings.get(StringsEnum.quayLai, ngonNgu),
              color: Colors.grey,
              onPressed: () => quay_ve_man_hinh_truoc(context),
              icon: Icons.arrow_back,
            ),
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String label;
  final Color color;
  final VoidCallback onPressed;
  final IconData? icon;

  const CustomButton({
    super.key,
    required this.label,
    required this.color,
    required this.onPressed,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon ?? Icons.circle, size: 18),
      label: Text(label),
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
      ),
    );
  }
}
