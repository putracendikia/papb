import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:papb/komponen/cardbutton.dart';

class PromoPage extends StatefulWidget {
  const PromoPage({super.key});

  @override
  State<PromoPage> createState() => _PromoPageState();
}

class _PromoPageState extends State<PromoPage>
    with SingleTickerProviderStateMixin {
  late final TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[50],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          "Promo",
          style: GoogleFonts.plusJakartaSans(color: Colors.black),
        ),
        bottom: TabBar(
          tabs: [
            Tab(text: 'promo'),
            Tab(text: 'main'),
          ],
          controller: tabController,
          labelColor: Colors.black,
          labelStyle: GoogleFonts.plusJakartaSans(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: TabBarView(
        children: [
          Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(children: [
              CardButton(),
            ]),
          ),
          Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(children: [
              CardButton(),
            ]),
          ),
        ],
        controller: tabController,
      ),
    );
  }
}
