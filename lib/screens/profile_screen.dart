import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Saya'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const CircleAvatar(
                  radius: 80,
                  // Ganti 'assets/profile.jpg' dengan path foto Anda
                  backgroundImage: AssetImage('assets/profile.jpg'),
                ),
                const SizedBox(height: 20),
                _buildProfileItem(Icons.person, "Nama", "Zakinanda Faishal Arifin"),
                _buildProfileItem(Icons.credit_card, "NIM", "124230023"),
                _buildProfileItem(Icons.cake, "Tempat, Tanggal Lahir", "Sleman, 10 Oktober 2004"),
                _buildProfileItem(Icons.favorite, "Hobi", "Mendengarkan Musik"),
                const SizedBox(height: 20),
                Text(
                  '"Live as if you were to die tomorrow. Learn as if you were to live forever."',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    color: Colors.grey[700],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProfileItem(IconData icon, String title, String subtitle) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Icon(icon, color: Colors.teal),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle, style: const TextStyle(fontSize: 16)),
      ),
    );
  }
}