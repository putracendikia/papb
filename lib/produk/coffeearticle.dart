import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:papb/keranjang/controler.dart';
import 'package:papb/produk/coffeetile.dart';
import 'package:toggle_switch/toggle_switch.dart';

class CoffeeArticle extends StatefulWidget {
  final String id;
  final String nameMenu;
  final String priceMenu;
  final String descMenu;
  final String image;

  const CoffeeArticle(
      {Key? key,
      required this.id,
      required this.nameMenu,
      required this.priceMenu,
      required this.descMenu,
      required this.image})
      : super(key: key);

  @override
  State<CoffeeArticle> createState() => _CoffeeArticleState();
}

class _CoffeeArticleState extends State<CoffeeArticle> {
  final Controler c = Get.put(Controler());

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
          widget.nameMenu,
          style: GoogleFonts.plusJakartaSans(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
      ),
    );
    body:
    SafeArea(
      child: (SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              child: Image.asset(
                './assets/image/produk_a.JPG',
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
                      SizedBox(width: 24),
                      ToggleSwitch(
                        activeBorders: [
                          Border.all(
                            color: Colors.brown,
                            width: 2.0,
                          ),
                          Border.all(
                            color: Colors.brown,
                            width: 2.0,
                          ),
                        ],
                        activeFgColor: Colors.black,
                        activeBgColor: [Colors.transparent],
                        inactiveBgColor: Colors.transparent,
                        isVertical: false,
                        minWidth: 80.0,
                        radiusStyle: true,
                        cornerRadius: 8.0,
                        initialLabelIndex: 2,
                        labels: ['Hot', 'Cold'],
                        customTextStyles: [
                          GoogleFonts.plusJakartaSans(
                              fontSize: 14.0, fontWeight: FontWeight.w800),
                          GoogleFonts.plusJakartaSans(
                              fontSize: 14.0, fontWeight: FontWeight.w800),
                        ],
                        onToggle: (index) {
                          print('switched to: $index');
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Row(
                    children: [
                      Text(
                        "Ukuran",
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 14,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      SizedBox(width: 24),
                      ToggleSwitch(
                        activeBorders: [
                          Border.all(
                            color: Colors.brown,
                            width: 2.0,
                          ),
                          Border.all(
                            color: Colors.brown,
                            width: 2.0,
                          ),
                          Border.all(
                            color: Colors.brown,
                            width: 2.0,
                          ),
                        ],
                        activeFgColor: Colors.black,
                        activeBgColor: [Colors.transparent],
                        inactiveBgColor: Colors.transparent,
                        isVertical: false,
                        minWidth: 60.0,
                        radiusStyle: true,
                        cornerRadius: 8.0,
                        initialLabelIndex: 3,
                        labels: ['S', 'M', 'L'],
                        customTextStyles: [
                          GoogleFonts.plusJakartaSans(
                              fontSize: 14.0, fontWeight: FontWeight.w800),
                          GoogleFonts.plusJakartaSans(
                              fontSize: 14.0, fontWeight: FontWeight.w800),
                          GoogleFonts.plusJakartaSans(
                              fontSize: 14.0, fontWeight: FontWeight.w800),
                        ],
                        onToggle: (index) {
                          print('switched to: $index');
                        },
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
    );
    bottomNavigationBar:
    BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 20,
      child: SizedBox(
        height: 96,
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                child: Image.asset(
                  widget.image,
                  height: 300,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          widget.nameMenu,
                          style: GoogleFonts.plusJakartaSans(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Spacer(),
                        Text(
                          widget.priceMenu,
                          style: GoogleFonts.plusJakartaSans(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      widget.descMenu,
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
                        SizedBox(width: 24),
                        ToggleSwitch(
                          activeBorders: [
                            Border.all(
                              color: Colors.brown,
                              width: 2.0,
                            ),
                            Border.all(
                              color: Colors.brown,
                              width: 2.0,
                            ),
                          ],
                          activeFgColor: Colors.black,
                          activeBgColor: [Colors.transparent],
                          inactiveBgColor: Colors.transparent,
                          isVertical: false,
                          minWidth: 80.0,
                          radiusStyle: true,
                          cornerRadius: 8.0,
                          initialLabelIndex: 2,
                          labels: ['Hot', 'Cold'],
                          customTextStyles: [
                            GoogleFonts.plusJakartaSans(
                                fontSize: 14.0, fontWeight: FontWeight.w800),
                            GoogleFonts.plusJakartaSans(
                                fontSize: 14.0, fontWeight: FontWeight.w800),
                          ],
                          onToggle: (index) {
                            print('switched to: $index');
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Row(
                      children: [
                        Text(
                          "Ukuran",
                          style: GoogleFonts.plusJakartaSans(
                            fontSize: 14,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        SizedBox(width: 24),
                        ToggleSwitch(
                          activeBorders: [
                            Border.all(
                              color: Colors.brown,
                              width: 2.0,
                            ),
                            Border.all(
                              color: Colors.brown,
                              width: 2.0,
                            ),
                            Border.all(
                              color: Colors.brown,
                              width: 2.0,
                            ),
                          ],
                          activeFgColor: Colors.black,
                          activeBgColor: [Colors.transparent],
                          inactiveBgColor: Colors.transparent,
                          isVertical: false,
                          minWidth: 60.0,
                          radiusStyle: true,
                          cornerRadius: 8.0,
                          initialLabelIndex: 3,
                          labels: ['S', 'M', 'L'],
                          customTextStyles: [
                            GoogleFonts.plusJakartaSans(
                                fontSize: 14.0, fontWeight: FontWeight.w800),
                            GoogleFonts.plusJakartaSans(
                                fontSize: 14.0, fontWeight: FontWeight.w800),
                            GoogleFonts.plusJakartaSans(
                                fontSize: 14.0, fontWeight: FontWeight.w800),
                          ],
                          onToggle: (index) {
                            print('switched to: $index');
                          },
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
        ),
      ),
    );
  }
}
