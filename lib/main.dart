import 'package:flutter/material.dart';

import 'screens/galeri_foto_page.dart';

void main() {
  runApp(const WidgetDasarApp());
}

class WidgetDasarApp extends StatelessWidget {
  const WidgetDasarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Widget Dasar Flutter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const GaleriFotoPage(),
    );
  }
}