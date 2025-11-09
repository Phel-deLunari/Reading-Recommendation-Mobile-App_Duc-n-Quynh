
enum NgonNgu { viet, anh }

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
      case StringsEnum.trangChu:
        return nn == NgonNgu.viet ? 'Trang chủ' : 'Home';
      case StringsEnum.danhMuc:
        return nn == NgonNgu.viet ? 'Danh mục' : 'Categories';
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
  trangChu,
  danhMuc, 
}

