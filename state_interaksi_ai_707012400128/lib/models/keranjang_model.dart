import 'package:flutter/foundation.dart';

class Produk {
  final String nama;
  final int harga;
  final String ikon;

  const Produk({
    required this.nama,
    required this.harga,
    required this.ikon,
  });
}

class ItemKeranjang {
  final Produk produk;
  int jumlah;

  ItemKeranjang({
    required this.produk,
    this.jumlah = 1,
  });
}

class KeranjangModel extends ChangeNotifier {
  final List<ItemKeranjang> _items = [];

  List<ItemKeranjang> get items {
    return List.unmodifiable(_items);
  }

  int get totalJumlah {
    int total = 0;

    for (final ItemKeranjang item in _items) {
      total += item.jumlah;
    }

    return total;
  }

  int get totalHarga {
    int total = 0;

    for (final ItemKeranjang item in _items) {
      total += item.produk.harga * item.jumlah;
    }

    return total;
  }

  void tambah(Produk produk) {
    for (final ItemKeranjang item in _items) {
      if (item.produk.nama == produk.nama) {
        item.jumlah++;
        notifyListeners();
        return;
      }
    }

    _items.add(
      ItemKeranjang(
        produk: produk,
      ),
    );

    notifyListeners();
  }

  void kurangi(Produk produk) {
    for (int i = 0; i < _items.length; i++) {
      final ItemKeranjang item = _items[i];

      if (item.produk.nama == produk.nama) {
        if (item.jumlah > 1) {
          item.jumlah--;
        } else {
          _items.removeAt(i);
        }

        notifyListeners();
        return;
      }
    }
  }


  void kosongkan() {
    if (_items.isEmpty) {
      return;
    }

    _items.clear();
    notifyListeners();
  }
}