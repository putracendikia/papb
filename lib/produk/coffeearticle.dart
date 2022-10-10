import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:papb/produk/coffeetile.dart';

class CoffeeArticle extends StatefulWidget {
  const CoffeeArticle({super.key});

  @override
  State<CoffeeArticle> createState() => _CoffeeArticleState();
}

class _CoffeeArticleState extends State<CoffeeArticle> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.amber[50],
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: Text(
            "Produk A",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: SafeArea(
          child: (SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  child: Image.asset(
                    'assets/image/produk_a.JPG',
                    height: 300,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Produk A",
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        "Perpaduan cita rasa kopi, es dan juga air",
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      Row(
                        children: [
                          Text(
                            "Suhu",
                            style: GoogleFonts.plusJakartaSans(
                              fontSize: 14,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          Text(
                            "Hot",
                            style: GoogleFonts.plusJakartaSans(
                              fontSize: 14,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          Text(
                            "Cold",
                            style: GoogleFonts.plusJakartaSans(
                              fontSize: 14,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      Text(
                        "Ekstra Topping",
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: CoffeeTile(),
                          ),
                          SizedBox(width: 20),
                          Expanded(
                            child: CoffeeTile(),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: CoffeeTile(),
                          ),
                          SizedBox(width: 20),
                          Expanded(
                            child: CoffeeTile(),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
        ));
  }
}
