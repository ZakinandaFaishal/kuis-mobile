import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TimePage extends StatefulWidget {
  const TimePage({super.key});

  @override
  State<TimePage> createState() => _TimePageState();
}

class _TimePageState extends State<TimePage> {
  late Timer _timer;
  late DateTime _currentTime;

  @override
  void initState() {
    super.initState();
    _currentTime = DateTime.now();
    // Update waktu setiap detik
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (mounted) {
        setState(() {
          _currentTime = DateTime.now();
        });
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
  
  String _formatTime(DateTime time) {
    return DateFormat('HH:mm:ss').format(time);
  }

  @override
  Widget build(BuildContext context) {
    DateTime witaTime = _currentTime.add(const Duration(hours: 1));
    DateTime witTime = _currentTime.add(const Duration(hours: 2));

    return Scaffold(
      appBar: AppBar(title: const Text('Konversi Waktu Indonesia')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildTimeCard('WIB (Waktu Indonesia Barat)', _formatTime(_currentTime)),
              const SizedBox(height: 16),
              _buildTimeCard('WITA (Waktu Indonesia Tengah)', _formatTime(witaTime)),
              const SizedBox(height: 16),
              _buildTimeCard('WIT (Waktu Indonesia Timur)', _formatTime(witTime)),
            ],
          ),
        ),
      ),
    );
  }
  
  Widget _buildTimeCard(String zone, String time) {
    return Card(
      elevation: 4,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text(zone, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
            const SizedBox(height: 8),
            Text(time, style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}