import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:papb/komponen/cardbutton.dart';
import 'package:papb/order/order_page.dart';
import 'package:papb/promo/promo_detail.dart';

import '../home/main_menu.dart';
import '../home/main_page.dart';
import '../profile/profile_page.dart';

class PromoPage extends StatefulWidget {
  const PromoPage({super.key});

  @override
  State<PromoPage> createState() => _PromoPageState();
}

class _PromoPageState extends State<PromoPage> {
  final List<Map<String, dynamic>> promoMap = [
    {
      "judul": "Diskon 50% untuk anak baru",
      "berlaku": "Berlaku hingga 06 Sep 2022",
      "syarat":
          "Tanpa minimal pembelian untuk semua minuman non-promo dengan diskon 50% s/d Rp.20000. Promo berlaku di seluruh outlet Ngopeee",
      "urlimage": "./assets/image/produk_c.JPG"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.only(
            top: 40.0,
          ),
          margin: EdgeInsets.symmetric(
            horizontal: 20.0,
          ),
          child: Column(
            children: [
              Center(
                child: Text(
                  'Voucher',
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(
                height: 33,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Tersedia',
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(
                height: 16.0,
              ),
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: promoMap.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PromoDetail(
                                    judul:
                                        '${promoMap.elementAt(index)['judul']}',
                                    berlaku:
                                        '${promoMap.elementAt(index)['berlaku']}',
                                    syarat:
                                        '${promoMap.elementAt(index)['syarat']}',
                                    urlimage:
                                        '${promoMap.elementAt(index)['urlimage']}')));
                      },
                      child: Container(
                        width: 350.0,
                        height: 74.0,
                        padding: EdgeInsets.all(12.0),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromRGBO(0, 0, 0, 0.16),
                              blurRadius: 8,
                              spreadRadius: 1,
                            )
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '${promoMap.elementAt(index)['judul']}',
                              style: GoogleFonts.plusJakartaSans(
                                fontSize: 14.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            Text(
                              '${promoMap.elementAt(index)['syarat']}',
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.plusJakartaSans(
                                fontSize: 12.0,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ],
          ),
        ),
        floatingActionButton: const FloatingQR(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 10,
          child: SizedBox(
            height: 60,
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 20,
                ),
                // Row(
                //   crossAxisAlignment: CrossAxisAlignment.start,
                //   children: [
                MaterialButton(
                  minWidth: 40,
                  onPressed: () {
                    setState(() {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const MainPage();
                      }));
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.home, color: Colors.black),
                    ],
                  ),
                ),
                MaterialButton(
                  onPressed: () {
                    setState(
                      () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) {
                          return const OrderPage();
                        }));
                      },
                    );
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.emoji_food_beverage, color: Colors.black),
                    ],
                  ),
                ),
                const SizedBox(width: 70),
                MaterialButton(
                  onPressed: () {
                    setState(
                      () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) {
                          return const PromoPage();
                        }));
                      },
                    );
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.confirmation_num,
                          color: Color.fromARGB(255, 224, 194, 139)),
                    ],
                  ),
                ),
                MaterialButton(
                  onPressed: () {
                    setState(
                      () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) {
                          return const ProfilePage();
                        }));
                      },
                    );
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.account_circle, color: Colors.black),
                    ],
                  ),
                ),
                //   ],
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
