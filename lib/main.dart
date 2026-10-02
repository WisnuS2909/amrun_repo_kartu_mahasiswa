import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Profile Mahasiswa',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Roboto',
      ),
      home: const ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;

    // Skala dasar berdasarkan acuan lebar 1080px (Logical Pixel ~360)
    final double scale = screenWidth / 360.0;

    return Scaffold(
      body: Stack(
        children: [
          // 1. Header Diagonal Segitiga Hitam di Atas
          ClipPath(
            clipper: DiagonalHeaderClipper(),
            child: Container(
              height: screenHeight * 0.42,
              decoration: const BoxDecoration(
                color: Color(0xFF13171D),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 15,
                    spreadRadius: 5,
                    offset: Offset(0, 8),
                  ),
                ],
              ),
            ),
          ),

      

          // 3. Tombol Top Bar (Kembali & Pengaturan)
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16.0 * scale,
                vertical: 8.0 * scale,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: Colors.white,
                      size: 20 * scale,
                    ),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.settings_outlined,
                      color: Colors.white,
                      size: 24 * scale,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),

          // 4. Konten Utama Profile
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: screenHeight * 0.12),

                  // Foto Profil Melingkar Responsif
                  Center(
                    child: Container(
                      width: 165 * scale,
                      height: 165 * scale,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFF13171D),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black45,
                            blurRadius: 12,
                            offset: Offset(0, 6),
                          ),
                        ],
                      ),
                      padding: EdgeInsets.all(12 * scale),
                      child: const CircleAvatar(
                        backgroundImage: NetworkImage(
                          'https://tse2.mm.bing.net/th/id/OIP.AyLnd9jimcjDILCy8j4IPgHaHa?r=0&rs=1&pid=ImgDetMain&o=7&rm=3',
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20 * scale),

                  // Nama Mahasiswa
                  Text(
                    'Amrun Nizhom',
                    style: TextStyle(
                      fontSize: 24 * scale,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF1E2736),
                      letterSpacing: 0.5,
                    ),
                  ),
                  SizedBox(height: 8 * scale),

                  // Detail Prodi & Kampus
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32.0 * scale),
                    child: Text(
                      'Teknologi Rekayasa Multimedia | Universitas BOASH',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 13.5 * scale,
                        color: Colors.grey[600],
                        height: 1.3,
                      ),
                    ),
                  ),
                  SizedBox(height: 24 * scale),

                  // Tombol Sosial Media
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildSocialButton(Icons.language, scale),
                      SizedBox(width: 20 * scale),
                      _buildSocialButton(Icons.code, scale),
                      SizedBox(width: 20 * scale),
                      _buildSocialButton(Icons.alternate_email, scale),
                    ],
                  ),
                  SizedBox(height: 24 * scale),

                  // Garis Pembatas
                  Divider(
                    indent: 40 * scale,
                    endIndent: 40 * scale,
                    thickness: 1,
                    color: const Color(0xFFE0E0E0),
                  ),
                  SizedBox(height: 20 * scale),

                  // Baris Statistik
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildStatColumn('B01220058', 'NPM', scale),
                      _buildStatColumn('TRM', 'Jurusan', scale),
                      _buildStatColumn('6', 'Semester', scale),
                    ],
                  ),
                  SizedBox(height: 32 * scale),

                  // Tombol HUBUNGI SAYA
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF2C384A),
                      foregroundColor: Colors.white,
                      minimumSize: Size(180 * scale, 48 * scale),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24 * scale),
                      ),
                      elevation: 4,
                    ),
                    child: Text(
                      'HUBUNGI SAYA',
                      style: TextStyle(
                        fontSize: 14 * scale,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ),
                  SizedBox(height: 30 * scale),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget Helper Tombol Sosmed
  Widget _buildSocialButton(IconData icon, double scale) {
    return Container(
      width: 52 * scale,
      height: 52 * scale,
      decoration: const BoxDecoration(
        color: Color(0xFF2C384A),
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Icon(icon, color: Colors.white, size: 24 * scale),
    );
  }

  // Widget Helper Kolom Statistik
  Widget _buildStatColumn(String number, String label, double scale) {
    return Column(
      children: [
        Text(
          number,
          style: TextStyle(
            fontSize: 16 * scale,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF1E2736),
          ),
        ),
        SizedBox(height: 4 * scale),
        Text(
          label,
          style: TextStyle(
            fontSize: 13 * scale,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}

// Custom Clipper Header Diagonal
class DiagonalHeaderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height * 0.42);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}