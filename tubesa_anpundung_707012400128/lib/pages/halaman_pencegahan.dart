import 'package:flutter/material.dart';

class HalamanPencegahan extends StatelessWidget {
  const HalamanPencegahan({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> informasi = [
      {
        'judul': 'Kenali Tarif Resmi',
        'deskripsi':
            'Pastikan mengetahui tarif resmi sebelum '
            'menggunakan pelayanan publik.',
        'ikon': Icons.receipt_long,
      },
      {
        'judul': 'Jangan Memberikan Imbalan',
        'deskripsi':
            'Jangan memberikan uang atau imbalan '
            'di luar ketentuan pelayanan.',
        'ikon': Icons.money_off,
      },
      {
        'judul': 'Simpan Bukti',
        'deskripsi':
            'Simpan bukti pembayaran, dokumen, atau '
            'informasi lain yang berkaitan dengan kejadian.',
        'ikon': Icons.folder_copy,
      },
      {
        'judul': 'Laporkan Dugaan Pungli',
        'deskripsi':
            'Gunakan Anpundung untuk melaporkan '
            'dugaan pungutan liar.',
        'ikon': Icons.report,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pencegahan Pungli'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: const [
                  Icon(
                    Icons.shield,
                    size: 60,
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Bersama Cegah Pungli',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Masyarakat memiliki peran penting '
                    'dalam menciptakan pelayanan publik '
                    'yang bersih dan transparan.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          ...informasi.map(
            (item) {
              return Card(
                margin:
                    const EdgeInsets.only(bottom: 12),
                child: ListTile(
                  contentPadding:
                      const EdgeInsets.all(16),
                  leading: CircleAvatar(
                    child: Icon(
                      item['ikon'] as IconData,
                    ),
                  ),
                  title: Text(
                    item['judul'] as String,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Padding(
                    padding:
                        const EdgeInsets.only(
                      top: 6,
                    ),
                    child: Text(
                      item['deskripsi'] as String,
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}