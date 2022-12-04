import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:papb/keranjang/cartlist.dart';
import 'package:papb/komponen/cardbutton.dart';
import 'package:papb/komponen/outletmodal.dart';
import 'package:papb/komponen/promomodal.dart';
import 'package:papb/order/order_page.dart';
import 'package:papb/payment/payment.dart';
import 'package:papb/promo/promo_detail.dart';
import 'package:papb/struk/struk.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
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
          "Keranjang",
          style: GoogleFonts.plusJakartaSans(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                CardButton(),
                SizedBox(height: 16),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Pesanan',
                          style: GoogleFonts.plusJakartaSans(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            primary: const Color.fromARGB(255, 153, 110, 56),
                            textStyle: GoogleFonts.plusJakartaSans(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return const OrderPage();
                            }));
                          },
                          child: const Text('Tambah Pesanan'),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    CartList(),
                    SizedBox(height: 20),
                    CartList(),
                  ],
                ),
                SizedBox(height: 40),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Promo Voucher',
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 16),
                      ListView.builder(
                          shrinkWrap: true,
                          itemCount: promoMap.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                showPilihModal(context);
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
                )
              ],
            )),
      ),
      bottomNavigationBar: BottomAppBar(
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Total',
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 2),
                    Text(
                      'Rp 24.000',
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    SizedBox(height: 8),
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 153, 110, 56),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  width: 140,
                  height: 52,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const PaymentMenu();
                      }));
                    },
                    child: const Center(
                      child: Text(
                        'Beli Sekarang',
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
