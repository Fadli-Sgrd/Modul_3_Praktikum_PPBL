import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/keranjang_model.dart';

class HalamanProduk extends StatelessWidget {
  const HalamanProduk({super.key});

  static const List<Produk> daftarProduk = [
    Produk(
      nama: 'Nasi Goreng',
      harga: 15000,
      ikon: '🍳',
    ),
    Produk(
      nama: 'Mie Ayam',
      harga: 12000,
      ikon: '🍜',
    ),
    Produk(
      nama: 'Ayam Geprek',
      harga: 18000,
      ikon: '🍗',
    ),
    Produk(
      nama: 'Es Teh',
      harga: 5000,
      ikon: '🧋',
    ),
  ];

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
        title: const Text('Daftar Produk'),
        centerTitle: true,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: daftarProduk.length,
        separatorBuilder: (context, index) {
          return const SizedBox(height: 10);
        },
        itemBuilder: (context, index) {
          final Produk produk = daftarProduk[index];

          return Card(
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              leading: Text(
                produk.ikon,
                style: const TextStyle(
                  fontSize: 32,
                ),
              ),
              title: Text(
                produk.nama,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                _formatHarga(produk.harga),
              ),
              trailing: ElevatedButton(
                onPressed: () {
                  context.read<KeranjangModel>().tambah(produk);
                },
                child: const Text('Tambah'),
              ),
            ),
          );
        },
      ),
    );
  }
}