import 'package:flutter/material.dart';
import 'package:papb/home/main_menu.dart';
import 'package:papb/home/promo_slider.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Expanded(
            child: Container(
              height: double.maxFinite,
              color: Colors.blue,
              child: Stack(
                children: [
                  const PromoSlider(),
                  const Positioned(
                      top: 200, left: 0, right: 0, child: CoreMenu()),
                  Positioned(
                    top: 180,
                    left: 0,
                    right: 0,
                    child: Column(
                      children: const [
                        LoyaltyWidget(),
                        SizedBox(
                          height: 10,
                        ),
                        PilihOutlet(),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: const FloatingQR(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const NavBar(),
    );
  }
}
