import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:papb/komponen/batalmodal.dart';
import 'package:papb/komponen/cardbutton.dart';
import 'package:papb/komponen/jadwalmodal.dart';
import 'package:papb/payment/deliverytable.dart';
import 'package:papb/payment/detailprice.dart';
import 'package:papb/payment/paymentbox.dart';
import 'package:papb/struk/struk.dart';
import 'package:http/http.dart' as http;

class PaymentMenu extends StatefulWidget {
  const PaymentMenu({super.key});

  @override
  State<PaymentMenu> createState() => _PaymentMenuState();
}

class _PaymentMenuState extends State<PaymentMenu> {
  final DateTime _timeAmbil = DateTime.now();

  postData() async {
    var res = await http.post(Uri.parse("http://103.187.146.72:3000/api/ngopeee/transaction/checkout"),
      body: {
        "totalPrice": "90000",
        "payment": "GOPAY"
      }
    );
    print(res.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[50],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: GestureDetector(
          onTap: () {
            showBatalModal(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        title: Text(
          "Pembayaran",
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
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                "Outlet",
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                "Ngopee Km. 10",
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ]),
          ),
          SizedBox(
            height: 32,
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Metode Pembayaran",
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
                      child: PayBox(),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: PayBox(),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: PayBox(),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 32,
          ),
          Container(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                "Pesanan",
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 16,
              ),
              YourDelivery(),
              SizedBox(
                height: 8,
              ),
              YourDelivery(),
            ]),
          ),
          SizedBox(
            height: 32,
          ),
          Container(
            width: 1000,
            height: 78,
            decoration: BoxDecoration(
              border: Border.all(
                width: 2,
                color: Color.fromARGB(255, 6, 209, 57),
              ),
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Voucher bisa dipakai',
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Diskon 50% untuk anak baru',
                    style: GoogleFonts.plusJakartaSans(fontSize: 12),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 32,
          ),
          Container(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              DetailPrice(),
              SizedBox(height: 8),
              DetailPrice(),
            ]),
          )
        ]),
      )),
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
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 2,
                      color: const Color.fromARGB(255, 153, 110, 56),
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  width: 140,
                  height: 52,
                  child: GestureDetector(
                    onTap: () {
                      showJadwalModal(context);
                    },
                    child: const Center(
                      child: Text(
                        'Jadwalkan',
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
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
                      postData();
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) {
                        return const StrukBelanja();
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
