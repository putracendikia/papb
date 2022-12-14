import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:papb/komponen/cardbutton.dart';
import 'package:papb/payment/deliverytable.dart';
import 'package:papb/payment/detailprice.dart';
import 'package:papb/payment/paymentbox.dart';
import 'package:papb/struk/struk.dart';

class PaymentMenu extends StatefulWidget {
  const PaymentMenu({super.key});

  @override
  State<PaymentMenu> createState() => _PaymentMenuState();
}

class _PaymentMenuState extends State<PaymentMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[50],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          "Pembayaran",
          style: GoogleFonts.plusJakartaSans(color: Colors.black),
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
          CardButton(),
          SizedBox(
            height: 32,
          ),
          Container(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              DetailPrice(),
              SizedBox(
                height: 8,
              ),
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
                      width: 1.5,
                      color: const Color.fromARGB(255, 153, 110, 56),
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  width: 140,
                  height: 52,
                  child: GestureDetector(
                    onTap: () {},
                    child: const Center(
                      child: Text(
                        'Jadwalkan',
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
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
                      Navigator.push(context,
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
