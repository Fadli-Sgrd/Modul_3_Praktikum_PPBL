import 'package:flutter/material.dart';

class HalamanTentangAplikasi extends StatelessWidget {
  const HalamanTentangAplikasi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tentang Aplikasi'),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const CircleAvatar(
                radius: 50,
                child: Icon(
                  Icons.location_city,
                  size: 50,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Nusantara Cerdas Mobile',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'Aplikasi layanan warga untuk mendukung '
                'konsep kota cerdas melalui akses layanan '
                'publik yang mudah, terintegrasi, dan responsif.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'Versi 1.0.0',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}