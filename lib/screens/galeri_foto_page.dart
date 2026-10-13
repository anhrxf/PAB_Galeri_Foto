import 'package:flutter/material.dart';

import 'widget_demo_page.dart';

class GaleriFotoPage extends StatelessWidget {
  const GaleriFotoPage({super.key});

  static const String _imageUrl = 'https://picsum.photos/id/88/300/200';

  static const String _description =
      'Sebuah persimpangan jalan di Barcelona, Spanyol. Foto ini '
      'menampilkan berbagai kendaraan yang bergerak dalam arah yang '
      'berbeda, menciptakan pemandangan yang sibuk dan energik.';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Galeri Foto'),
        actions: [
          IconButton(
            tooltip: 'Buka Widget Demo',
            icon: const Icon(Icons.widgets_outlined),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: (context) => const WidgetDemoPage(),
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildPhoto(),
            const SizedBox(height: 20),
            const Text(
              'Persimpangan Jalan di Barcelona',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            _buildInfoRow(
              icon: Icons.place,
              text: 'Barcelona, Spanyol',
              color: Colors.red,
            ),
            const SizedBox(height: 10),
            _buildInfoRow(
              icon: Icons.calendar_month,
              text: 'Tanggal tidak dicantumkan',
              color: Colors.blue,
            ),
            const SizedBox(height: 20),
            const Text(
              _description,
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 16,
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPhoto() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Image.network(
        _imageUrl,
        width: double.infinity,
        height: 220,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) {
            return child;
          }

          final expectedBytes = loadingProgress.expectedTotalBytes;
          final progress = expectedBytes == null
              ? null
              : loadingProgress.cumulativeBytesLoaded / expectedBytes;

          return SizedBox(
            height: 220,
            child: Center(
              child: CircularProgressIndicator(value: progress),
            ),
          );
        },
        errorBuilder: (context, error, stackTrace) {
          return Container(
            height: 220,
            width: double.infinity,
            color: Colors.grey.shade300,
            alignment: Alignment.center,
            child: const Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.broken_image_outlined, size: 40),
                SizedBox(height: 8),
                Text('Gambar tidak dapat dimuat. Periksa koneksi internet.'),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildInfoRow({
    required IconData icon,
    required String text,
    required Color color,
  }) {
    return Row(
      children: [
        Icon(icon, color: color),
        const SizedBox(width: 8),
        Expanded(child: Text(text)),
      ],
    );
  }
}