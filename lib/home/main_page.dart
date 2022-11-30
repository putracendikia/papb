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
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            constraints: const BoxConstraints(minHeight: 800),
            color: const Color.fromARGB(255, 255, 250, 235),
            child: Column(
              children: [
                Container(
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
      floatingActionButton: const FloatingQR(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Row(
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              MaterialButton(
                minWidth: 40,
                onPressed: () {
                  setState(() {});
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.home, color: Color.fromARGB(255, 224, 194, 139)),
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
                    Icon(Icons.confirmation_num, color: Colors.black),
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
    );
  }
}
