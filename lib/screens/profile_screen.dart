import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Saya'),
        centerTitle: true,
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
        elevation: 1,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: colorScheme.primary, width: 3),
              ),
              child: const CircleAvatar(
                radius: 70,
                backgroundImage: AssetImage('assets/profile.jpg'),
              ),
            ),
            const SizedBox(height: 24),
            _buildProfileItem(
              context,
              Icons.person,
              "Nama",
              "Zakinanda Faishal Arifin",
            ),
            _buildProfileItem(context, Icons.credit_card, "NIM", "124230023"),
            _buildProfileItem(
              context,
              Icons.cake,
              "Tempat, Tanggal Lahir",
              "Sleman, 10 Oktober 2004",
            ),
            _buildProfileItem(
              context,
              Icons.favorite,
              "Hobi",
              "Mendengarkan Musik",
            ),
            const SizedBox(height: 28),
            Text(
              '"Live as if you were to die tomorrow. Learn as if you were to live forever."',
              textAlign: TextAlign.center,
              style: textTheme.bodyMedium?.copyWith(
                fontStyle: FontStyle.italic,
                color: colorScheme.secondary,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileItem(
    BuildContext context,
    IconData icon,
    String title,
    String subtitle,
  ) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Icon(icon, color: colorScheme.primary),
        title: Text(
          title,
          style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(subtitle, style: textTheme.bodyLarge),
      ),
    );
  }
}
