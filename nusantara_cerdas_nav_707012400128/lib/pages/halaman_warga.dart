import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/favorit_model.dart';
import '../models/pengajuan_model.dart';

class HalamanWarga extends StatelessWidget {
  const HalamanWarga({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Warga'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 35,
                    child: Icon(
                      Icons.person,
                      size: 36,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Warga Nusantara',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 6),
                        Text(
                          'Pengguna Layanan Publik',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          Consumer<FavoritModel>(
            builder: (
              context,
              favoritModel,
              child,
            ) {
              final List<String> favorit =
                  favoritModel.layananFavorit.toList();

              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Layanan Favorit',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 12),
                      if (favorit.isEmpty)
                        const Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 16,
                          ),
                          child: Text(
                            'Belum ada layanan favorit.',
                          ),
                        )
                      else
                        ...favorit.map(
                          (namaLayanan) {
                            return ListTile(
                              contentPadding:
                                  EdgeInsets.zero,
                              leading: const Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              title: Text(
                                namaLayanan,
                              ),
                              trailing: IconButton(
                                icon: const Icon(
                                  Icons.remove_circle_outline,
                                ),
                                onPressed: () {
                                  context
                                      .read<FavoritModel>()
                                      .batalTandai(
                                        namaLayanan,
                                      );
                                },
                              ),
                            );
                          },
                        ),
                    ],
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 20),
          Consumer<PengajuanModel>(
            builder: (
              context,
              pengajuanModel,
              child,
            ) {
              final daftar =
                  pengajuanModel.daftarPengajuan;

              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Expanded(
                            child: Text(
                              'Pengajuan Layanan',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Badge(
                            label: Text(
                              '${pengajuanModel.totalPengajuan}',
                            ),
                            isLabelVisible:
                                pengajuanModel.totalPengajuan > 0,
                            child: const Icon(
                              Icons.assignment,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      if (daftar.isEmpty)
                        const Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 16,
                          ),
                          child: Text(
                            'Belum ada pengajuan layanan.',
                          ),
                        )
                      else
                        ...List.generate(
                          daftar.length,
                          (index) {
                            return ListTile(
                              contentPadding:
                                  EdgeInsets.zero,
                              leading: CircleAvatar(
                                child: Text(
                                  '${index + 1}',
                                ),
                              ),
                              title: Text(
                                daftar[index],
                              ),
                              subtitle: const Text(
                                'Pengajuan tercatat',
                              ),
                            );
                          },
                        ),
                    ],
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