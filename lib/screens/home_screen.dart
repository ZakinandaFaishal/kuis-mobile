import 'package:flutter/material.dart';
import 'package:kuis/pages/pyramid_page.dart';
import 'package:kuis/pages/time_page.dart';
import 'package:kuis/pages/day_page.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu Utama'),
      ),
      body: GridView.count(
        padding: const EdgeInsets.all(20),
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        children: <Widget>[
          _buildMenuCard(
            context,
            icon: Icons.change_history,
            label: 'Kalkulator Piramida',
            page: const PyramidPage(),
          ),
          _buildMenuCard(
            context,
            icon: Icons.access_time_filled,
            label: 'Konversi Waktu',
            page: const TimePage(),
          ),
          _buildMenuCard(
            context,
            icon: Icons.calendar_today,
            label: 'Cek Hari',
            page: const DayPage(),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuCard(BuildContext context, {required IconData icon, required String label, required Widget page}) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => page),
          );
        },
        borderRadius: BorderRadius.circular(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(icon, size: 50, color: Colors.teal),
            const SizedBox(height: 10),
            Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}