import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/favorit_model.dart';
import '../navigation/app_routes.dart';

class HalamanLayanan extends StatelessWidget {
  const HalamanLayanan({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Layanan Publik'),
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.description),
                text: 'Perizinan',
              ),
              Tab(
                icon: Icon(Icons.local_hospital),
                text: 'Kesehatan',
              ),
              Tab(
                icon: Icon(Icons.directions_bus),
                text: 'Transportasi',
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            _DaftarLayanan(
              layanan: [
                'KTP Elektronik',
                'Kartu Keluarga',
                'Surat Domisili',
                'Surat Keterangan Usaha',
              ],
            ),
            _DaftarLayanan(
              layanan: [
                'Pendaftaran Puskesmas',
                'Jadwal Vaksinasi',
                'Konsultasi Kesehatan',
                'Cek Kesehatan Gratis',
              ],
            ),
            _DaftarLayanan(
              layanan: [
                'Kartu Transportasi',
                'Layanan Bus Kota',
                'Informasi Rute Bus',
                'Pengaduan Transportasi',
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _DaftarLayanan extends StatelessWidget {
  final List<String> layanan;

  const _DaftarLayanan({
    required this.layanan,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: layanan.length,
      itemBuilder: (context, index) {
        final String namaLayanan = layanan[index];

        return _KartuLayanan(
          namaLayanan: namaLayanan,
        );
      },
    );
  }
}

class _KartuLayanan extends StatelessWidget {
  final String namaLayanan;

  const _KartuLayanan({
    required this.namaLayanan,
  });

  @override
  Widget build(BuildContext context) {
    final bool isFavorit =
        context.watch<FavoritModel>().isFavorit(namaLayanan);

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: CircleAvatar(
          child: Icon(
            Icons.miscellaneous_services,
          ),
        ),
        title: Text(
          namaLayanan,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: const Text(
          'Layanan publik Nusantara Cerdas',
        ),
        trailing: IconButton(
          tooltip: isFavorit
              ? 'Hapus dari favorit'
              : 'Tambahkan ke favorit',
          icon: Icon(
            isFavorit ? Icons.star : Icons.star_border,
            color: isFavorit ? Colors.amber : null,
          ),
          onPressed: () {
            final FavoritModel favorit =
                context.read<FavoritModel>();

            if (favorit.isFavorit(namaLayanan)) {
              favorit.batalTandai(namaLayanan);
            } else {
              favorit.tandai(namaLayanan);
            }
          },
        ),
        onTap: () async {
          final String? hasil = await Navigator.pushNamed(
            context,
            AppRoutes.detailLayanan,
            arguments: namaLayanan,
          );

          if (!context.mounted) {
            return;
          }

          if (hasil != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  '$hasil berhasil ditambahkan ke pengajuan.',
                ),
              ),
            );
          }
        },
      ),
    );
  }
}