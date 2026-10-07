import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/pengajuan_model.dart';

class HalamanDetailLayanan extends StatefulWidget {
  final String namaLayanan;

  const HalamanDetailLayanan({
    super.key,
    required this.namaLayanan,
  });

  @override
  State<HalamanDetailLayanan> createState() =>
      _HalamanDetailLayananState();
}

class _HalamanDetailLayananState
    extends State<HalamanDetailLayanan> {
  bool _sedangMengirim = false;

  Future<void> _ajukanPermohonan() async {
    if (_sedangMengirim) {
      return;
    }

    setState(() {
      _sedangMengirim = true;
    });

    await Future.delayed(
      const Duration(seconds: 2),
    );

    if (!mounted) {
      return;
    }

    context
        .read<PengajuanModel>()
        .tambahPengajuan(widget.namaLayanan);

    setState(() {
      _sedangMengirim = false;
    });

    Navigator.pop(
      context,
      widget.namaLayanan,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Layanan'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 35,
                      child: Icon(
                        Icons.miscellaneous_services,
                        size: 36,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      widget.namaLayanan,
                      style: const TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'Nusantara Cerdas menyediakan layanan '
                      'publik digital untuk membantu masyarakat '
                      'mengakses pelayanan kota dengan lebih mudah.',
                      style: TextStyle(
                        fontSize: 16,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Informasi Layanan',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 12),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: Icon(Icons.access_time),
                      title: Text('Waktu pelayanan'),
                      subtitle: Text('Senin - Jumat, 08.00 - 16.00'),
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: Icon(Icons.phone),
                      title: Text('Bantuan'),
                      subtitle: Text('Hubungi pusat layanan warga'),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              height: 52,
              child: FilledButton.icon(
                onPressed:
                    _sedangMengirim ? null : _ajukanPermohonan,
                icon: _sedangMengirim
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                        ),
                      )
                    : const Icon(Icons.send),
                label: Text(
                  _sedangMengirim
                      ? 'Mengirim Pengajuan...'
                      : 'Ajukan Permohonan',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}