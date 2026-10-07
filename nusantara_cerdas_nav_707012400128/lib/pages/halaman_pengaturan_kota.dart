import 'package:flutter/material.dart';

class HalamanPengaturanKota extends StatefulWidget {
  const HalamanPengaturanKota({super.key});

  @override
  State<HalamanPengaturanKota> createState() =>
      _HalamanPengaturanKotaState();
}

class _HalamanPengaturanKotaState
    extends State<HalamanPengaturanKota> {
  bool notifikasiAktif = true;
  bool lokasiAktif = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pengaturan Kota'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Card(
            child: SwitchListTile(
              title: const Text(
                'Notifikasi Layanan',
              ),
              subtitle: const Text(
                'Terima informasi terbaru dari layanan kota.',
              ),
              value: notifikasiAktif,
              onChanged: (value) {
                setState(() {
                  notifikasiAktif = value;
                });
              },
            ),
          ),
          Card(
            child: SwitchListTile(
              title: const Text(
                'Lokasi',
              ),
              subtitle: const Text(
                'Gunakan lokasi untuk layanan berbasis wilayah.',
              ),
              value: lokasiAktif,
              onChanged: (value) {
                setState(() {
                  lokasiAktif = value;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}