import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:papb/komponen/cardbutton.dart';
import 'package:papb/payment/deliverytable.dart';
import 'package:papb/payment/detailprice.dart';
import 'package:papb/payment/paymentbox.dart';

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
    );
  }
}
