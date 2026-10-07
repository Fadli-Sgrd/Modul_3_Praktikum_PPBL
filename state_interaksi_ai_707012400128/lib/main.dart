import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/keranjang_model.dart';
import 'pages/halaman_produk.dart';
import 'pages/halaman_keranjang.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => KeranjangModel(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kantin Kampus',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.indigo,
        ),
        useMaterial3: true,
      ),
      home: const HalamanUtama(),
    );
  }
}

class HalamanUtama extends StatefulWidget {
  const HalamanUtama({super.key});

  @override
  State<HalamanUtama> createState() => _HalamanUtamaState();
}

class _HalamanUtamaState extends State<HalamanUtama> {
  int _indeksTerpilih = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> halaman = [
      const HalamanProduk(),
      const HalamanKeranjang(),
    ];

    final int totalItem = context.select<KeranjangModel, int>(
      (keranjang) => keranjang.totalJumlah,
    );

    return Scaffold(
      body: halaman[_indeksTerpilih],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _indeksTerpilih,
        onDestinationSelected: (int indeks) {
          setState(() {
            _indeksTerpilih = indeks;
          });
        },
        destinations: [
          const NavigationDestination(
            icon: Icon(Icons.restaurant_menu_outlined),
            selectedIcon: Icon(Icons.restaurant_menu),
            label: 'Produk',
          ),
          NavigationDestination(
            icon: const Icon(Icons.shopping_cart_outlined),
            selectedIcon: const Icon(Icons.shopping_cart),
            label: 'Keranjang ($totalItem)',
          ),
        ],
      ),
    );
  }
}