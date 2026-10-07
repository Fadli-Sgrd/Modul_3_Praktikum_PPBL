import 'package:flutter/foundation.dart';

class PengajuanModel extends ChangeNotifier {
  final List<String> _daftarPengajuan = [];

  List<String> get daftarPengajuan {
    return List.unmodifiable(_daftarPengajuan);
  }

  int get totalPengajuan {
    return _daftarPengajuan.length;
  }

  void tambahPengajuan(String namaLayanan) {
    _daftarPengajuan.add(namaLayanan);
    notifyListeners();
  }

  void hapusPengajuan(int index) {
    if (index >= 0 && index < _daftarPengajuan.length) {
      _daftarPengajuan.removeAt(index);
      notifyListeners();
    }
  }

  void kosongkanPengajuan() {
    _daftarPengajuan.clear();
    notifyListeners();
  }
}