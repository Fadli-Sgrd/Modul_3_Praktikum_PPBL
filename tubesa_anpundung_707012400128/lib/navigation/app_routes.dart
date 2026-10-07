import 'package:flutter/material.dart';

import '../pages/halaman_buat_laporan.dart';
import '../pages/halaman_detail_laporan.dart';
import '../pages/halaman_pencegahan.dart';

class AppRoutes {
  static const String detailLaporan =
      '/detail-laporan';

  static const String buatLaporan =
      '/buat-laporan';

  static const String pencegahan =
      '/pencegahan';

  static Route<dynamic> generateRoute(
    RouteSettings settings,
  ) {
    switch (settings.name) {
      case detailLaporan:
        final int? id =
            settings.arguments is int
                ? settings.arguments as int
                : null;

        if (id == null) {
          return MaterialPageRoute(
            builder: (_) => const Scaffold(
              body: Center(
                child: Text(
                  'ID laporan tidak valid.',
                ),
              ),
            ),
          );
        }

        return MaterialPageRoute(
          builder: (_) =>
              HalamanDetailLaporan(
            idLaporan: id,
          ),
        );

      case buatLaporan:
        return MaterialPageRoute(
          builder: (_) =>
              const HalamanBuatLaporan(),
        );

      case pencegahan:
        return MaterialPageRoute(
          builder: (_) =>
              const HalamanPencegahan(),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text(
                'Halaman tidak ditemukan',
              ),
            ),
          ),
        );
    }
  }
}