import 'package:flutter/foundation.dart';

class Laporan {
  final int id;
  final String judul;
  final String lokasi;
  final String deskripsi;
  final String status;
  final String tanggal;

  Laporan({
    required this.id,
    required this.judul,
    required this.lokasi,
    required this.deskripsi,
    required this.status,
    required this.tanggal,
  });
}

class LaporanModel extends ChangeNotifier {
  final List<Laporan> _daftarLaporan = [
    Laporan(
      id: 1,
      judul: 'Pungli pelayanan administrasi',
      lokasi: 'Kecamatan Bandung Kulon',
      deskripsi:
          'Ditemukan permintaan biaya tambahan dalam proses pelayanan administrasi.',
      status: 'Diproses',
      tanggal: '28 September 2026',
    ),
    Laporan(
      id: 2,
      judul: 'Pungli parkir',
      lokasi: 'Alun-Alun Kota Bandung',
      deskripsi:
          'Petugas parkir meminta biaya melebihi tarif yang telah ditentukan.',
      status: 'Diterima',
      tanggal: '27 September 2026',
    ),
    Laporan(
      id: 3,
      judul: 'Pungli pelayanan dokumen',
      lokasi: 'Kecamatan Coblong',
      deskripsi:
          'Terdapat dugaan pungutan tambahan dalam pengurusan dokumen warga.',
      status: 'Selesai',
      tanggal: '25 September 2026',
    ),
  ];

  List<Laporan> get daftarLaporan {
    return List.unmodifiable(_daftarLaporan);
  }

  int get totalLaporan {
    return _daftarLaporan.length;
  }

  int get totalDiterima {
    return _daftarLaporan
        .where((laporan) => laporan.status == 'Diterima')
        .length;
  }

  int get totalDiproses {
    return _daftarLaporan
        .where((laporan) => laporan.status == 'Diproses')
        .length;
  }

  int get totalSelesai {
    return _daftarLaporan
        .where((laporan) => laporan.status == 'Selesai')
        .length;
  }

  Laporan? cariLaporan(int id) {
    for (final laporan in _daftarLaporan) {
      if (laporan.id == id) {
        return laporan;
      }
    }

    return null;
  }

  void tambahLaporan({
    required String judul,
    required String lokasi,
    required String deskripsi,
  }) {
    final int idBaru = _daftarLaporan.isEmpty
        ? 1
        : _daftarLaporan.last.id + 1;

    _daftarLaporan.insert(
      0,
      Laporan(
        id: idBaru,
        judul: judul,
        lokasi: lokasi,
        deskripsi: deskripsi,
        status: 'Diterima',
        tanggal: '30 September 2026',
      ),
    );

    notifyListeners();
  }
}