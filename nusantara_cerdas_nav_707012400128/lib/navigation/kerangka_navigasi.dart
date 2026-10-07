import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/pengajuan_model.dart';
import '../pages/halaman_beranda.dart';
import '../pages/halaman_layanan.dart';
import '../pages/halaman_warga.dart';
import 'app_routes.dart';

class KerangkaNavigasi extends StatefulWidget {
  const KerangkaNavigasi({super.key});

  @override
  State<KerangkaNavigasi> createState() =>
      _KerangkaNavigasiState();
}

class _KerangkaNavigasiState
    extends State<KerangkaNavigasi> {
  int _indexHalaman = 0;

  final List<Widget> _halaman = const [
    HalamanBeranda(),
    HalamanLayanan(),
    HalamanWarga(),
  ];

  void _ubahHalaman(int index) {
    setState(() {
      _indexHalaman = index;
    });
  }

  void _bukaDrawerPage(String route) {
    Navigator.pop(context);

    Navigator.pushNamed(
      context,
      route,
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final bool layarLebar =
            constraints.maxWidth >= 700;

        if (layarLebar) {
          return _buildLayarLebar();
        }

        return _buildLayarSempit();
      },
    );
  }

  Widget _buildLayarSempit() {
    return Scaffold(
      drawer: _buildDrawer(),
      body: IndexedStack(
        index: _indexHalaman,
        children: _halaman,
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _indexHalaman,
        onDestinationSelected: _ubahHalaman,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Beranda',
          ),
          NavigationDestination(
            icon: Icon(Icons.apps_outlined),
            selectedIcon: Icon(Icons.apps),
            label: 'Layanan',
          ),
          NavigationDestination(
            icon: IkonWargaDenganBadge(),
            selectedIcon: IkonWargaDenganBadge(
              terpilih: true,
            ),
            label: 'Warga',
          ),
        ],
      ),
    );
  }

  Widget _buildLayarLebar() {
    return Scaffold(
      drawer: _buildDrawer(),
      body: Row(
        children: [
          NavigationRail(
            selectedIndex: _indexHalaman,
            onDestinationSelected: _ubahHalaman,
            labelType: NavigationRailLabelType.all,
            leading: Padding(
              padding: const EdgeInsets.only(
                top: 12,
                bottom: 20,
              ),
              child: Builder(
                builder: (context) {
                  return IconButton(
                    tooltip: 'Menu',
                    icon: const Icon(Icons.menu),
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                  );
                },
              ),
            ),
            destinations: const [
              NavigationRailDestination(
                icon: Icon(Icons.home_outlined),
                selectedIcon: Icon(Icons.home),
                label: Text('Beranda'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.apps_outlined),
                selectedIcon: Icon(Icons.apps),
                label: Text('Layanan'),
              ),
              NavigationRailDestination(
                icon: IkonWargaDenganBadge(),
                selectedIcon: IkonWargaDenganBadge(
                  terpilih: true,
                ),
                label: Text('Warga'),
              ),
            ],
          ),
          const VerticalDivider(
            width: 1,
          ),
          Expanded(
            child: IndexedStack(
              index: _indexHalaman,
              children: _halaman,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawer() {
    return NavigationDrawer(
      selectedIndex: null,
      onDestinationSelected: (index) {
        if (index == 0) {
          Navigator.pop(context);
          _ubahHalaman(0);
        } else if (index == 1) {
          Navigator.pop(context);
          _ubahHalaman(1);
        } else if (index == 2) {
          Navigator.pop(context);
          _ubahHalaman(2);
        } else if (index == 3) {
          _bukaDrawerPage(
            AppRoutes.pengaturanKota,
          );
        } else if (index == 4) {
          _bukaDrawerPage(
            AppRoutes.tentangAplikasi,
          );
        }
      },
      children: const [
        Padding(
          padding: EdgeInsets.fromLTRB(
            28,
            16,
            16,
            12,
          ),
          child: Text(
            'Nusantara Cerdas',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        NavigationDrawerDestination(
          icon: Icon(Icons.home_outlined),
          selectedIcon: Icon(Icons.home),
          label: Text('Beranda'),
        ),
        NavigationDrawerDestination(
          icon: Icon(Icons.apps_outlined),
          selectedIcon: Icon(Icons.apps),
          label: Text('Layanan'),
        ),
        NavigationDrawerDestination(
          icon: Icon(Icons.person_outline),
          selectedIcon: Icon(Icons.person),
          label: Text('Warga'),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          child: Divider(),
        ),
        NavigationDrawerDestination(
          icon: Icon(Icons.settings_outlined),
          selectedIcon: Icon(Icons.settings),
          label: Text('Pengaturan Kota'),
        ),
        NavigationDrawerDestination(
          icon: Icon(Icons.info_outline),
          selectedIcon: Icon(Icons.info),
          label: Text('Tentang Aplikasi'),
        ),
      ],
    );
  }
}

class IkonWargaDenganBadge extends StatelessWidget {
  final bool terpilih;

  const IkonWargaDenganBadge({
    super.key,
    this.terpilih = false,
  });

  @override
  Widget build(BuildContext context) {
    final int totalPengajuan =
        context.select<PengajuanModel, int>(
      (model) => model.totalPengajuan,
    );

    return Badge(
      isLabelVisible: totalPengajuan > 0,
      label: Text(
        '$totalPengajuan',
      ),
      child: Icon(
        terpilih
            ? Icons.person
            : Icons.person_outline,
      ),
    );
  }
}