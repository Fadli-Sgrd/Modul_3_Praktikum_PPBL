import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/laporan_model.dart';

class HalamanDetailLaporan extends StatelessWidget {
  final int idLaporan;

  const HalamanDetailLaporan({
    super.key,
    required this.idLaporan,
  });

  @override
  Widget build(BuildContext context) {
    final Laporan? laporan =
        context.select<LaporanModel, Laporan?>(
      (model) => model.cariLaporan(idLaporan),
    );

    if (laporan == null) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Detail Laporan'),
        ),
        body: const Center(
          child: Text(
            'Laporan tidak ditemukan.',
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Laporan'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [
            Card(
              child: Padding(
                padding:
                    const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const CircleAvatar(
                          radius: 28,
                          child: Icon(
                            Icons.assignment,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Text(
                            laporan.judul,
                            style:
                                const TextStyle(
                              fontSize: 22,
                              fontWeight:
                                  FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    _InfoItem(
                      ikon: Icons.location_on,
                      judul: 'Lokasi',
                      isi: laporan.lokasi,
                    ),
                    _InfoItem(
                      ikon: Icons.calendar_today,
                      judul: 'Tanggal',
                      isi: laporan.tanggal,
                    ),
                    _InfoItem(
                      ikon: Icons.info,
                      judul: 'Status',
                      isi: laporan.status,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Card(
              child: Padding(
                padding:
                    const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Deskripsi Laporan',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight:
                            FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      laporan.deskripsi,
                      style: const TextStyle(
                        fontSize: 16,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Card(
              child: Padding(
                padding:
                    const EdgeInsets.all(20),
                child: Row(
                  children: const [
                    Icon(
                      Icons.verified_user,
                      size: 36,
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: Text(
                        'Identitas pelapor dilindungi '
                        'dan laporan diproses sesuai '
                        'mekanisme yang berlaku.',
                        style: TextStyle(
                          height: 1.4,
                        ),
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

class _InfoItem extends StatelessWidget {
  final IconData ikon;
  final String judul;
  final String isi;

  const _InfoItem({
    required this.ikon,
    required this.judul,
    required this.isi,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          Icon(ikon),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Text(
                  judul,
                  style: const TextStyle(
                    fontWeight:
                        FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(isi),
              ],
            ),
          ),
        ],
      ),
    );
  }
}