import 'package:flutter/material.dart';

class HalamanBeranda extends StatelessWidget {
  const HalamanBeranda({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> pilar = [
      {
        'judul': 'Smart Governance',
        'deskripsi': 'Pelayanan pemerintahan yang transparan dan terintegrasi.',
        'ikon': Icons.account_balance,
      },
      {
        'judul': 'Smart Branding',
        'deskripsi': 'Membangun identitas dan daya tarik kota.',
        'ikon': Icons.campaign,
      },
      {
        'judul': 'Smart Economy',
        'deskripsi': 'Mendorong pertumbuhan ekonomi digital masyarakat.',
        'ikon': Icons.trending_up,
      },
      {
        'judul': 'Smart Living',
        'deskripsi': 'Meningkatkan kualitas hidup warga kota.',
        'ikon': Icons.home,
      },
      {
        'judul': 'Smart Society',
        'deskripsi': 'Mendorong masyarakat yang aktif dan kolaboratif.',
        'ikon': Icons.groups,
      },
      {
        'judul': 'Smart Environment',
        'deskripsi': 'Mewujudkan lingkungan kota yang berkelanjutan.',
        'ikon': Icons.eco,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Nusantara Cerdas'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      child: Icon(
                        Icons.location_city,
                        size: 32,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Selamat Datang, Warga!',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 6),
                          Text(
                            'Akses layanan publik dalam satu aplikasi.',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Enam Pilar Kota Cerdas',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: pilar.length,
              gridDelegate:
                  const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 400,
                mainAxisExtent: 160,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
              ),
              itemBuilder: (context, index) {
                final item = pilar[index];

                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          item['ikon'] as IconData,
                          size: 32,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          item['judul'] as String,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          item['deskripsi'] as String,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}