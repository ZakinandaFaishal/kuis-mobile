import 'package:flutter/material.dart';

class DayPage extends StatefulWidget {
  const DayPage({super.key});

  @override
  State<DayPage> createState() => _DayPageState();
}

class _DayPageState extends State<DayPage> {
  final _dayController = TextEditingController();
  String? _result;

  void _checkDay() {
    final int? dayNumber = int.tryParse(_dayController.text);
    String? dayName;

    if (dayNumber == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Masukkan angka terlebih dahulu')),
      );
      return;
    }

    switch (dayNumber) {
      case 1:
        dayName = 'Senin';
        break;
      case 2:
        dayName = 'Selasa';
        break;
      case 3:
        dayName = 'Rabu';
        break;
      case 4:
        dayName = 'Kamis';
        break;
      case 5:
        dayName = 'Jumat';
        break;
      case 6:
        dayName = 'Sabtu';
        break;
      case 7:
        dayName = 'Minggu';
        break;
      default:
        dayName = null;
    }

    setState(() {
      if (dayName != null) {
        _result = 'Hari ke-$dayNumber adalah: $dayName';
      } else {
        _result = '❌ Nomor tidak valid! Masukkan angka 1-7.';
      }
    });
  }

  @override
  void dispose() {
    _dayController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cek Hari')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _dayController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Masukkan Nomor Hari (1-7)',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.calendar_today),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: _checkDay,
              icon: const Icon(Icons.search),
              label: const Text('Cek Hari'),
            ),
            const SizedBox(height: 30),
            if (_result != null)
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.teal.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.teal, width: 1),
                ),
                child: Text(
                  _result!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
