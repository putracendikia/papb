import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class CardPromo extends StatefulWidget {
  const CardPromo({super.key});

  @override
  State<CardPromo> createState() => _CardPromoState();
}

class _CardPromoState extends State<CardPromo> {
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
              'Diskon 50% untuk anak baru',
              style: GoogleFonts.plusJakartaSans(
                fontSize: 14,
                fontWeight: FontWeight.w800,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'bla bla bla',
              style: GoogleFonts.plusJakartaSans(fontSize: 12),
            ),
          ],
        ),
      ),
    );
    ;
  }
}
