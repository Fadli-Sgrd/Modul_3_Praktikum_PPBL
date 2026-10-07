import 'package:flutter/material.dart';

import '../pages/halaman_detail_layanan.dart';
import '../pages/halaman_pengaturan_kota.dart';
import '../pages/halaman_tentang_aplikasi.dart';

class AppRoutes {
  static const String detailLayanan = '/detail-layanan';
  static const String pengaturanKota = '/pengaturan-kota';
  static const String tentangAplikasi = '/tentang-aplikasi';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case detailLayanan:
        final String namaLayanan =
            settings.arguments is String
                ? settings.arguments as String
                : 'Layanan';

        return MaterialPageRoute(
          builder: (_) => HalamanDetailLayanan(
            namaLayanan: namaLayanan,
          ),
        );

      case pengaturanKota:
        return MaterialPageRoute(
          builder: (_) => const HalamanPengaturanKota(),
        );

      case tentangAplikasi:
        return MaterialPageRoute(
          builder: (_) => const HalamanTentangAplikasi(),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text(
                'Halaman tidak ditemukan',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        );
    }
  }
}