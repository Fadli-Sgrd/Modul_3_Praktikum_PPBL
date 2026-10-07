import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/laporan_model.dart';

class HalamanBeranda extends StatelessWidget {
  const HalamanBeranda({super.key});

  @override
  Widget build(BuildContext context) {
    final laporan = context.watch<LaporanModel>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Anpundung'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Sistem Anti Pungli Kota Bandung',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Laporkan dugaan pungutan liar dengan '
                      'mudah, aman, dan transparan.',
                      style: TextStyle(
                        fontSize: 16,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: FilledButton.icon(
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            '/buat-laporan',
                          );
                        },
                        icon: const Icon(Icons.add),
                        label: const Text(
                          'Buat Laporan',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Statistik Laporan',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics:
                  const NeverScrollableScrollPhysics(),
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 1.5,
              children: [
                _KartuStatistik(
                  judul: 'Total Laporan',
                  jumlah: laporan.totalLaporan,
                  ikon: Icons.assignment,
                ),
                _KartuStatistik(
                  judul: 'Diterima',
                  jumlah: laporan.totalDiterima,
                  ikon: Icons.inbox,
                ),
                _KartuStatistik(
                  judul: 'Diproses',
                  jumlah: laporan.totalDiproses,
                  ikon: Icons.hourglass_top,
                ),
                _KartuStatistik(
                  judul: 'Selesai',
                  jumlah: laporan.totalSelesai,
                  ikon: Icons.check_circle,
                ),
              ],
            ),
            const SizedBox(height: 24),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    const Icon(
                      Icons.shield,
                      size: 42,
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Jaga Integritas Pelayanan',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight:
                                  FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 6),
                          Text(
                            'Jangan memberikan uang atau '
                            'imbalan di luar ketentuan '
                            'resmi pelayanan publik.',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _KartuStatistik extends StatelessWidget {
  final String judul;
  final int jumlah;
  final IconData ikon;

  const _KartuStatistik({
    required this.judul,
    required this.jumlah,
    required this.ikon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center,
          children: [
            Icon(
              ikon,
              size: 30,
            ),
            const SizedBox(height: 8),
            Text(
              '$jumlah',
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(judul),
          ],
        ),
      ),
    );
  }
}