import 'package:flutter/material.dart';

class WidgetDemoPage extends StatelessWidget {
  const WidgetDemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Widget Demo'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 200,
              width: double.infinity,
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(16),
              color: Colors.blue,
              child: const Center(
                child: Text(
                  'Widget Demo',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Tombol Elevated'),
            ),
            const SizedBox(height: 16),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.star, color: Colors.amber),
                SizedBox(width: 8),
                Text('Rating: 4.5'),
              ],
            ),
            const SizedBox(height: 16),
            Image.network(
              'https://picsum.photos/id/7/300/200',
              width: 200,
              height: 150,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return const SizedBox(
                  width: 200,
                  height: 150,
                  child: Center(
                    child: Text('Gambar tidak dapat dimuat.'),
                  ),
                );
              },
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}