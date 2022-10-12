import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class CardButton2 extends StatelessWidget {
  const CardButton2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1000,
      height: 74,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.amber[100],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Ngopee Km.10',
              style: GoogleFonts.plusJakartaSans(
                fontSize: 14,
                fontWeight: FontWeight.w800,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'No.24 Jalan Soekarno Hatta Km.10',
              style: GoogleFonts.plusJakartaSans(fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
