import 'package:flutter/material.dart';
import 'package:papb/home/main_menu.dart';
import 'package:papb/home/promo_slider.dart';
import 'package:papb/order/order_page.dart';
import 'package:papb/profile/profile_page.dart';
import 'package:papb/promo/promo.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            constraints: const BoxConstraints(minHeight: 400),
            color: const Color.fromARGB(255, 255, 250, 235),
            child: Column(
              children: [
                SizedBox(
                  height: 320,
                  child: Stack(
                    children: [
                      const PromoSlider(),
                      Positioned(
                        top: 180,
                        left: 0,
                        right: 0,
                        child: Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: 10.0,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              LoyaltyWidget(),
                              SizedBox(
                                height: 10,
                              ),
                              PilihOutlet(),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                CoreMenu(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
