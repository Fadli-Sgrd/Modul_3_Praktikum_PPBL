import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/laporan_model.dart';

class HalamanBuatLaporan extends StatefulWidget {
  const HalamanBuatLaporan({super.key});

  @override
  State<HalamanBuatLaporan> createState() =>
      _HalamanBuatLaporanState();
}

class _HalamanBuatLaporanState
    extends State<HalamanBuatLaporan> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _judulController =
      TextEditingController();

  final TextEditingController _lokasiController =
      TextEditingController();

  final TextEditingController _deskripsiController =
      TextEditingController();

  bool _sedangMengirim = false;

  @override
  void dispose() {
    _judulController.dispose();
    _lokasiController.dispose();
    _deskripsiController.dispose();
    super.dispose();
  }

  void _kirimLaporan() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      _sedangMengirim = true;
    });

    Future.delayed(
      const Duration(seconds: 1),
      () {
        if (!mounted) {
          return;
        }

        context.read<LaporanModel>().tambahLaporan(
              judul: _judulController.text.trim(),
              lokasi: _lokasiController.text.trim(),
              deskripsi:
                  _deskripsiController.text.trim(),
            );

        setState(() {
          _sedangMengirim = false;
        });

        ScaffoldMessenger.of(context)
            .showSnackBar(
          const SnackBar(
            content: Text(
              'Laporan berhasil dikirim.',
            ),
          ),
        );

        Navigator.pop(context);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buat Laporan'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            const Text(
              'Laporkan Dugaan Pungli',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Berikan informasi yang jelas agar '
              'laporan dapat ditindaklanjuti.',
            ),
            const SizedBox(height: 24),
            TextFormField(
              controller: _judulController,
              decoration: const InputDecoration(
                labelText: 'Judul Laporan',
                hintText:
                    'Contoh: Pungli pelayanan KTP',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null ||
                    value.trim().isEmpty) {
                  return 'Judul wajib diisi';
                }

                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _lokasiController,
              decoration: const InputDecoration(
                labelText: 'Lokasi Kejadian',
                hintText:
                    'Contoh: Kecamatan Coblong',
                border: OutlineInputBorder(),
                prefixIcon:
                    Icon(Icons.location_on),
              ),
              validator: (value) {
                if (value == null ||
                    value.trim().isEmpty) {
                  return 'Lokasi wajib diisi';
                }

                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _deskripsiController,
              maxLines: 6,
              decoration: const InputDecoration(
                labelText: 'Deskripsi',
                hintText:
                    'Jelaskan kejadian yang dilaporkan...',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null ||
                    value.trim().isEmpty) {
                  return 'Deskripsi wajib diisi';
                }

                return null;
              },
            ),
            const SizedBox(height: 24),
            SizedBox(
              height: 52,
              child: FilledButton.icon(
                onPressed: _sedangMengirim
                    ? null
                    : _kirimLaporan,
                icon: _sedangMengirim
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child:
                            CircularProgressIndicator(
                          strokeWidth: 2,
                        ),
                      )
                    : const Icon(Icons.send),
                label: Text(
                  _sedangMengirim
                      ? 'Mengirim...'
                      : 'Kirim Laporan',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}