import 'package:flutter/material.dart';

class HalamanSetState extends StatefulWidget {
  const HalamanSetState({super.key});

  @override
  State<HalamanSetState> createState() => _HalamanSetStateState();
}

class _HalamanSetStateState extends State<HalamanSetState> {
  int _jumlahPesanan = 0;
  bool _kantinBuka = true;

  void _tambahPesanan() {
    setState(() {
      _jumlahPesanan++;
    });
  }

  void _kurangiPesanan() {
    if (_jumlahPesanan > 0) {
      setState(() {
        _jumlahPesanan--;
      });
    }
  }

  void _ubahStatusKantin(bool nilai) {
    setState(() {
      _kantinBuka = nilai;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Latihan setState()'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    const Icon(
                      Icons.shopping_cart,
                      size: 50,
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Jumlah Pesanan',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '$_jumlahPesanan',
                      style: const TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton.icon(
                          onPressed: _kurangiPesanan,
                          icon: const Icon(Icons.remove),
                          label: const Text('Kurangi'),
                        ),
                        const SizedBox(width: 12),
                        ElevatedButton.icon(
                          onPressed: _tambahPesanan,
                          icon: const Icon(Icons.add),
                          label: const Text('Tambah'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Card(
              child: SwitchListTile(
                value: _kantinBuka,
                onChanged: _ubahStatusKantin,
                title: const Text(
                  'Status Kantin',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  _kantinBuka ? 'Kantin sedang buka' : 'Kantin sedang tutup',
                ),
                secondary: Icon(
                  _kantinBuka
                      ? Icons.store
                      : Icons.storefront_outlined,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}