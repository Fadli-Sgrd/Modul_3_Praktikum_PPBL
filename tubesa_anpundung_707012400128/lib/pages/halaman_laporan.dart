import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/laporan_model.dart';

class HalamanLaporan extends StatefulWidget {
  const HalamanLaporan({super.key});

  @override
  State<HalamanLaporan> createState() =>
      _HalamanLaporanState();
}

class _HalamanLaporanState
    extends State<HalamanLaporan> {
  int _filterIndex = 0;

  final List<String> _filter = [
    'Semua',
    'Diterima',
    'Diproses',
    'Selesai',
  ];

  @override
  Widget build(BuildContext context) {
    final laporanModel =
        context.watch<LaporanModel>();

    final semuaLaporan =
        laporanModel.daftarLaporan;

    final String filterAktif =
        _filter[_filterIndex];

    final List<Laporan> laporanTampil =
        filterAktif == 'Semua'
            ? semuaLaporan
            : semuaLaporan
                .where(
                  (laporan) =>
                      laporan.status ==
                      filterAktif,
                )
                .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Laporan Warga'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(
              16,
              16,
              16,
              8,
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  _filter.length,
                  (index) {
                    final bool aktif =
                        _filterIndex == index;

                    return Padding(
                      padding:
                          const EdgeInsets.only(
                        right: 8,
                      ),
                      child: ChoiceChip(
                        label: Text(
                          _filter[index],
                        ),
                        selected: aktif,
                        onSelected: (_) {
                          setState(() {
                            _filterIndex = index;
                          });
                        },
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          Expanded(
            child: laporanTampil.isEmpty
                ? const Center(
                    child: Column(
                      mainAxisAlignment:
                          MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.inbox_outlined,
                          size: 60,
                        ),
                        SizedBox(height: 12),
                        Text(
                          'Belum ada laporan',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    padding:
                        const EdgeInsets.all(16),
                    itemCount:
                        laporanTampil.length,
                    itemBuilder:
                        (context, index) {
                      final laporan =
                          laporanTampil[index];

                      return Card(
                        margin:
                            const EdgeInsets.only(
                          bottom: 12,
                        ),
                        child: ListTile(
                          contentPadding:
                              const EdgeInsets.all(
                            16,
                          ),
                          leading: CircleAvatar(
                            child: Icon(
                              _ikonStatus(
                                laporan.status,
                              ),
                            ),
                          ),
                          title: Text(
                            laporan.judul,
                            style:
                                const TextStyle(
                              fontWeight:
                                  FontWeight.bold,
                            ),
                          ),
                          subtitle: Padding(
                            padding:
                                const EdgeInsets
                                    .only(
                              top: 6,
                            ),
                            child: Column(
                              crossAxisAlignment:
                                  CrossAxisAlignment
                                      .start,
                              children: [
                                Text(
                                  laporan.lokasi,
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  laporan.tanggal,
                                ),
                                const SizedBox(
                                  height: 6,
                                ),
                                _StatusBadge(
                                  status:
                                      laporan.status,
                                ),
                              ],
                            ),
                          ),
                          isThreeLine: true,
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              '/detail-laporan',
                              arguments:
                                  laporan.id,
                            );
                          },
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
      floatingActionButton:
          FloatingActionButton.extended(
        onPressed: () {
          Navigator.pushNamed(
            context,
            '/buat-laporan',
          );
        },
        icon: const Icon(Icons.add),
        label: const Text('Lapor'),
      ),
    );
  }

  IconData _ikonStatus(String status) {
    switch (status) {
      case 'Diterima':
        return Icons.inbox;
      case 'Diproses':
        return Icons.hourglass_top;
      case 'Selesai':
        return Icons.check;
      default:
        return Icons.assignment;
    }
  }
}

class _StatusBadge extends StatelessWidget {
  final String status;

  const _StatusBadge({
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 5,
      ),
      decoration: BoxDecoration(
        borderRadius:
            BorderRadius.circular(20),
        color: _warnaStatus(status)
            .withValues(alpha: 0.15),
      ),
      child: Text(
        status,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: _warnaStatus(status),
        ),
      ),
    );
  }

  Color _warnaStatus(String status) {
    switch (status) {
      case 'Diterima':
        return Colors.blue;
      case 'Diproses':
        return Colors.orange;
      case 'Selesai':
        return Colors.green;
      default:
        return Colors.grey;
    }
  }
}