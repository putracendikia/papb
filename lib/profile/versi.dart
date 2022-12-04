import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class VersiAplikasi extends StatefulWidget {
  const VersiAplikasi({super.key});

  @override
  State<VersiAplikasi> createState() => _VersiAplikasiState();
}

class _VersiAplikasiState extends State<VersiAplikasi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[50],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        title: Text(
          'Versi Aplikasi',
          style: GoogleFonts.plusJakartaSans(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(
                '1.0',
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 32.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 32.0,
                  ),
                  Text(
                    'Kebijakan Privasi',
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur sed dolor tellus. Proin eget tempus nulla. Integer vitae blandit ligula. In vitae lectus finibus mi elementum auctor. In tristique condimentum mi, vitae euismod purus tempus nec. Curabitur at elit orci.',
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    height: 24.0,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
