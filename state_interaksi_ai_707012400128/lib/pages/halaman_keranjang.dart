import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/keranjang_model.dart';

class HalamanKeranjang extends StatelessWidget {
  const HalamanKeranjang({super.key});

  String _formatHarga(int harga) {
    return 'Rp ${harga.toString().replaceAllMapped(
          RegExp(r'(\d)(?=(\d{3})+(?!\d))'),
          (match) => '${match.group(1)}.',
        )}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Keranjang'),
        centerTitle: true,
      ),
      body: Consumer<KeranjangModel>(
        builder: (context, keranjang, child) {
          if (keranjang.items.isEmpty) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.shopping_cart_outlined,
                    size: 80,
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Keranjang masih kosong',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            );
          }

          return Column(
            children: [
              Expanded(
                child: ListView.separated(
                  padding: const EdgeInsets.all(16),
                  itemCount: keranjang.items.length,
                  separatorBuilder: (context, index) {
                    return const SizedBox(height: 10);
                  },
                  itemBuilder: (context, index) {
                    final ItemKeranjang item = keranjang.items[index];

                    return Card(
                      child: ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        leading: Text(
                          item.produk.ikon,
                          style: const TextStyle(
                            fontSize: 32,
                          ),
                        ),
                        title: Text(
                          item.produk.nama,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          '${_formatHarga(item.produk.harga)}\n'
                          'Jumlah: ${item.jumlah}',
                        ),
                        isThreeLine: true,
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              onPressed: () {
                                keranjang.kurangi(item.produk);
                              },
                              icon: const Icon(
                                Icons.remove_circle_outline,
                              ),
                            ),
                            Text(
                              '${item.jumlah}',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                keranjang.tambah(item.produk);
                              },
                              icon: const Icon(
                                Icons.add_circle_outline,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 8,
                      offset: Offset(0, -2),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Total Harga',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          _formatHarga(keranjang.totalHarga),
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          keranjang.kosongkan();
                        },
                        icon: const Icon(Icons.delete_outline),
                        label: const Text('Kosongkan Keranjang'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}