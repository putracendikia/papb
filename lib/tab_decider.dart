import 'package:flutter/material.dart';
import 'package:papb/home/main_menu.dart';
import 'package:papb/home/main_page.dart';
import 'package:papb/komponen/globalvariable.dart';
import 'package:papb/komponen/jadwalmodal.dart';
import 'package:papb/komponen/loginmodal.dart';
import 'package:papb/order/order_page.dart';
import 'package:papb/profile/profile_page.dart';
import 'package:papb/promo/promo.dart';

class TabDecider extends StatefulWidget {
  const TabDecider({super.key});

  @override
  State<TabDecider> createState() => _TabDeciderState();
}

class _TabDeciderState extends State<TabDecider> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IndexedStack(
          index: currentPage,
          children: [
            MainPage(),
            OrderPage(),
            PromoPage(),
            ProfilePage(),
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Row(
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              InkWell(
                onTap: () {
                  setState(() {
                    currentPage = 0;
                  });
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 22),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.home,
                          color: currentPage == 0
                              ? Color.fromARGB(255, 224, 194, 139)
                              : Colors.black),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(
                    () {
                      currentPage = 1;
                    },
                  );
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 22),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.emoji_food_beverage,
                          color: currentPage == 1
                              ? Color.fromARGB(255, 224, 194, 139)
                              : Colors.black),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 70),
              InkWell(
                onTap: () {
                  setState(
                    () {
                      currentPage = 2;
                    },
                  );
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 22),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.confirmation_num,
                          color: currentPage == 2
                              ? Color.fromARGB(255, 224, 194, 139)
                              : Colors.black),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(
                    () {
                      isLogin ? currentPage = 3 : showLoginModal(context);
                    },
                  );
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 22),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.account_circle,
                          color: currentPage == 3
                              ? Color.fromARGB(255, 224, 194, 139)
                              : Colors.black),
                    ],
                  ),
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
