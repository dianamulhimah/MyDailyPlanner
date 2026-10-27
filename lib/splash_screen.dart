import 'package:flutter/material.dart';
import 'dart:async';
import 'login_page.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Navigate to LoginPage after 3 seconds
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    });

    // Mengambil ukuran layar untuk responsivitas
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white, // Warna latar belakang
      body: SafeArea(
        child: Stack(
          children: [
            // Jam di bagian atas
            Positioned(
              top: 16, // Jarak dari atas
              left: 16, // Jarak dari kiri
              child: Text(
                "", // Jam
                style: TextStyle(
                  fontSize: screenWidth * 0.05, // Ukuran teks responsif
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            // Logo di tengah layar
            Center(
              child: Image.asset(
                'assets/images/logo.png', // Ganti dengan lokasi file gambar Anda
                width: screenWidth * 0.5, // Lebar responsif
                height: screenHeight * 0.3, // Tinggi responsif
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
