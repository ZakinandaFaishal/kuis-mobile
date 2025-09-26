import 'package:flutter/material.dart';
import 'dart:math';

class PyramidPage extends StatefulWidget {
  const PyramidPage({super.key});

  @override
  State<PyramidPage> createState() => _PyramidPageState();
}

class _PyramidPageState extends State<PyramidPage> {
  final _baseLengthController = TextEditingController();
  final _baseWidthController = TextEditingController();
  final _heightController = TextEditingController();

  String _volumeResult = "0.0";
  String _surfaceAreaResult = "0.0";

  void _calculate() {
    final double baseLength = double.tryParse(_baseLengthController.text) ?? 0;
    final double baseWidth = double.tryParse(_baseWidthController.text) ?? 0;
    final double height = double.tryParse(_heightController.text) ?? 0;

    if (baseLength > 0 && baseWidth > 0 && height > 0) {
      // Volume = 1/3 * Luas Alas * Tinggi
      final volume = (1 / 3) * baseLength * baseWidth * height;

      // Luas Permukaan = Luas Alas + Luas Seluruh Sisi Tegak
      final slantHeight1 = sqrt(pow(baseWidth / 2, 2) + pow(height, 2));
      final slantHeight2 = sqrt(pow(baseLength / 2, 2) + pow(height, 2));
      final baseArea = baseLength * baseWidth;
      final sideArea = (baseLength * slantHeight1) + (baseWidth * slantHeight2);
      final surfaceArea = baseArea + sideArea;
      
      setState(() {
        _volumeResult = volume.toStringAsFixed(2);
        _surfaceAreaResult = surfaceArea.toStringAsFixed(2);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Kalkulator Piramida')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildTextField(_baseLengthController, 'Panjang Alas (cm)'),
              const SizedBox(height: 12),
              _buildTextField(_baseWidthController, 'Lebar Alas (cm)'),
              const SizedBox(height: 12),
              _buildTextField(_heightController, 'Tinggi (cm)'),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _calculate,
                child: const Text('Hitung'),
              ),
              const SizedBox(height: 24),
              const Text('Hasil:', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              Text('Volume: $_volumeResult cm³', style: const TextStyle(fontSize: 18)),
              Text('Luas Permukaan: $_surfaceAreaResult cm²', style: const TextStyle(fontSize: 18)),
            ],
          ),
        ),
      ),
    );
  }

  TextField _buildTextField(TextEditingController controller, String label) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
      ),
    );
  }
}