import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PromoDetail extends StatelessWidget {
  final String judul;
  final String berlaku;
  final String syarat;
  final String urlimage;

  const PromoDetail(
      {Key? key,
      required this.judul,
      required this.berlaku,
      required this.syarat,
      required this.urlimage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20.0),
              padding: const EdgeInsets.only(
                top: 20.0,
              ),
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: IconButton(
                          onPressed: () => Navigator.pop(context, false),
                          icon: const Icon(Icons.arrow_back_ios),
                        ),
                      ),
                      const Text(
                        'Voucher',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Image.asset(
              '$urlimage',
              width: double.infinity,
              height: 240.0,
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '$judul',
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      '$berlaku',
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 12.0,
                        fontWeight: FontWeight.w600,
                        color: Color.fromRGBO(0, 174, 17, 1),
                      ),
                    ),
                    const SizedBox(
                      height: 48.0,
                    ),
                    Text('Syarat & Ketentuan',
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w600,
                        )),
                    Text(
                      '$syarat',
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 12.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
