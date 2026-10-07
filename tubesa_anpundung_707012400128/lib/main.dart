import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/laporan_model.dart';
import 'navigation/app_routes.dart';
import 'navigation/kerangka_navigasi.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => LaporanModel(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Anpundung',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.indigo,
      ),
      home: const KerangkaNavigasi(),
      onGenerateRoute:
          AppRoutes.generateRoute,
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text(
                'Halaman tidak ditemukan',
              ),
            ),
          ),
        );
      },
    );
  }
}