import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/laporan_model.dart';

class HalamanProfil extends StatelessWidget {
  const HalamanProfil({super.key});

  @override
  Widget build(BuildContext context) {
    final totalLaporan =
        context.select<LaporanModel, int>(
      (model) => model.totalLaporan,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 45,
                    child: Icon(
                      Icons.person,
                      size: 48,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Warga Anpundung',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Masyarakat Kota Bandung',
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Card(
            child: ListTile(
              leading: const Icon(
                Icons.assignment,
              ),
              title: const Text(
                'Total Laporan',
              ),
              subtitle: const Text(
                'Jumlah laporan yang dibuat',
              ),
              trailing: Text(
                '$totalLaporan',
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Card(
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(
                    Icons.security,
                  ),
                  title: const Text(
                    'Perlindungan Identitas',
                  ),
                  subtitle: const Text(
                    'Identitas pelapor dijaga.',
                  ),
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(
                    Icons.notifications,
                  ),
                  title: const Text(
                    'Notifikasi',
                  ),
                  subtitle: const Text(
                    'Dapatkan informasi perkembangan laporan.',
                  ),
                  onTap: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}