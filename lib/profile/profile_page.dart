import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:papb/profile/editprofil_page.dart';
import 'package:papb/promo/promo.dart';

import '../home/main_menu.dart';
import '../home/main_page.dart';
import '../order/order_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(top: 20.0),
          margin: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              Row(
                children: [
                  const Text(
                    'Nama User',
                    style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const Spacer(),
                  Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 153, 110, 56),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    width: 100,
                    height: 40,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const EditProfile();
                        }));
                      },
                      child: const Center(
                        child: Text('Edit Profil',
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            )),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Center(
                child: Container(
                  width: 350,
                  height: 74,
                  padding: const EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 3.0,
                          blurRadius: 5)
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text('Status', style: TextStyle(fontSize: 14.0)),
                          Text(
                            'Level 1',
                            style: TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                      const VerticalDivider(
                        color: Color.fromRGBO(224, 194, 139, 1),
                        width: 1,
                        thickness: 2,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: const [
                          Text('Ngoin', style: TextStyle(fontSize: 14.0)),
                          Text(
                            '20',
                            style: TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: const [
                        Icon(
                          Icons.help,
                          size: 32.0,
                          color: Color.fromARGB(255, 153, 110, 56),
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        Text(
                          'Bantuan',
                          style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    Row(
                      children: const [
                        Icon(
                          Icons.feed_rounded,
                          size: 32.0,
                          color: Color.fromARGB(255, 153, 110, 56),
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        Text(
                          'Syarat dan Ketentuan',
                          style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    Row(
                      children: const [
                        Icon(
                          Icons.privacy_tip,
                          size: 32.0,
                          color: Color.fromARGB(255, 153, 110, 56),
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        Text(
                          'Kebijakan Privasi',
                          style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    Row(
                      children: const [
                        Icon(
                          Icons.phone_android,
                          size: 32.0,
                          color: Color.fromARGB(255, 153, 110, 56),
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        Text(
                          'Tentang Aplikasi',
                          style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    Row(
                      children: const [
                        Icon(
                          Icons.phonelink_setup,
                          size: 32.0,
                          color: Color.fromARGB(255, 153, 110, 56),
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        Text(
                          'Versi Aplikasi',
                          style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 50.0,
                    ),
                    GestureDetector(
                      child: Container(
                        width: 350,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 202, 59, 59),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Center(
                          child: Text(
                            'Keluar',
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
            ],
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
                    () {},
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
                    Icon(
                      Icons.account_circle,
                      color: Color.fromARGB(255, 224, 194, 139),
                    ),
                  ],
                ),
              ),
              //   ],
              // ),
            ],
          ),
        ),
      ),
    ));
  }
}
