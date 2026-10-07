import 'package:flutter/material.dart';

import '../pages/halaman_beranda.dart';
import '../pages/halaman_laporan.dart';
import '../pages/halaman_pencegahan.dart';
import '../pages/halaman_profil.dart';
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
    HalamanLaporan(),
    HalamanProfil(),
  ];

  void _ubahHalaman(int index) {
    setState(() {
      _indexHalaman = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (
        context,
        constraints,
      ) {
        if (constraints.maxWidth >= 700) {
          return _layarLebar();
        }

        return _layarSempit();
      },
    );
  }

  Widget _layarSempit() {
    return Scaffold(
      drawer: _buildDrawer(),
      body: IndexedStack(
        index: _indexHalaman,
        children: _halaman,
      ),
      bottomNavigationBar:
          NavigationBar(
        selectedIndex: _indexHalaman,
        onDestinationSelected:
            _ubahHalaman,
        destinations: const [
          NavigationDestination(
            icon: Icon(
              Icons.home_outlined,
            ),
            selectedIcon: Icon(
              Icons.home,
            ),
            label: 'Beranda',
          ),
          NavigationDestination(
            icon: Icon(
              Icons.assignment_outlined,
            ),
            selectedIcon: Icon(
              Icons.assignment,
            ),
            label: 'Laporan',
          ),
          NavigationDestination(
            icon: Icon(
              Icons.person_outline,
            ),
            selectedIcon: Icon(
              Icons.person,
            ),
            label: 'Profil',
          ),
        ],
      ),
    );
  }

  Widget _layarLebar() {
    return Scaffold(
      drawer: _buildDrawer(),
      body: Row(
        children: [
          NavigationRail(
            selectedIndex: _indexHalaman,
            onDestinationSelected:
                _ubahHalaman,
            labelType:
                NavigationRailLabelType.all,
            leading: Builder(
              builder: (context) {
                return IconButton(
                  tooltip: 'Menu',
                  icon: const Icon(
                    Icons.menu,
                  ),
                  onPressed: () {
                    Scaffold.of(context)
                        .openDrawer();
                  },
                );
              },
            ),
            destinations: const [
              NavigationRailDestination(
                icon: Icon(
                  Icons.home_outlined,
                ),
                selectedIcon: Icon(
                  Icons.home,
                ),
                label: Text('Beranda'),
              ),
              NavigationRailDestination(
                icon: Icon(
                  Icons.assignment_outlined,
                ),
                selectedIcon: Icon(
                  Icons.assignment,
                ),
                label: Text('Laporan'),
              ),
              NavigationRailDestination(
                icon: Icon(
                  Icons.person_outline,
                ),
                selectedIcon: Icon(
                  Icons.person,
                ),
                label: Text('Profil'),
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

  NavigationDrawer _buildDrawer() {
    return NavigationDrawer(
      onDestinationSelected: (index) {
        Navigator.pop(context);

        if (index < 3) {
          _ubahHalaman(index);
        } else if (index == 3) {
          Navigator.pushNamed(
            context,
            AppRoutes.pencegahan,
          );
        }
      },
      children: const [
        Padding(
          padding: EdgeInsets.fromLTRB(
            28,
            20,
            16,
            12,
          ),
          child: Text(
            'ANPUNDUNG',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(
            28,
            0,
            16,
            16,
          ),
          child: Text(
            'Sistem Anti Pungli Kota Bandung',
          ),
        ),
        NavigationDrawerDestination(
          icon: Icon(
            Icons.home_outlined,
          ),
          selectedIcon: Icon(
            Icons.home,
          ),
          label: Text('Beranda'),
        ),
        NavigationDrawerDestination(
          icon: Icon(
            Icons.assignment_outlined,
          ),
          selectedIcon: Icon(
            Icons.assignment,
          ),
          label: Text('Laporan'),
        ),
        NavigationDrawerDestination(
          icon: Icon(
            Icons.person_outline,
          ),
          selectedIcon: Icon(
            Icons.person,
          ),
          label: Text('Profil'),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          child: Divider(),
        ),
        NavigationDrawerDestination(
          icon: Icon(
            Icons.shield_outlined,
          ),
          selectedIcon: Icon(
            Icons.shield,
          ),
          label: Text('Pencegahan Pungli'),
        ),
      ],
    );
  }
}