import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/favorit_model.dart';
import 'models/pengajuan_model.dart';
import 'navigation/app_routes.dart';
import 'navigation/kerangka_navigasi.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<FavoritModel>(
          create: (_) => FavoritModel(),
        ),
        ChangeNotifierProvider<PengajuanModel>(
          create: (_) => PengajuanModel(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nusantara Cerdas Mobile',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.indigo,
      ),
      home: const KerangkaNavigasi(),
      onGenerateRoute: AppRoutes.generateRoute,
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) {
            return const Scaffold(
              body: Center(
                child: Text(
                  'Halaman tidak ditemukan',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}