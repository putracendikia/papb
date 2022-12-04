import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:papb/home/main_page.dart';
import 'package:papb/komponen/outletmodal.dart';
import 'package:papb/order/order_page.dart';

import '../produk/coffeearticle.dart';

// ini pilih outlet

class PilihOutlet extends StatefulWidget {
  const PilihOutlet({Key? key}) : super(key: key);

  @override
  State<PilihOutlet> createState() => _PilihOutletState();
}

class _PilihOutletState extends State<PilihOutlet> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showPilihOutlet(context);
      },
      child: ShadowContainer(
        child: SizedBox(
          height: 55,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Ngopeee Km.10',
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Jalan Pahlawan No 20 ',
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ini loyalty

class LoyaltyWidget extends StatefulWidget {
  const LoyaltyWidget({Key? key}) : super(key: key);

  @override
  State<LoyaltyWidget> createState() => _LoyaltyWidgetState();
}

class _LoyaltyWidgetState extends State<LoyaltyWidget> {
  @override
  Widget build(BuildContext context) {
    return ShadowContainer(
      child: SizedBox(
        height: 25,
        child: Row(
          children: [
            Text(
              'Loyalty',
              style: GoogleFonts.plusJakartaSans(
                  fontSize: 14.0, fontWeight: FontWeight.w400),
            ),
            const Spacer(),
            Text(
              'Level 1',
              style: GoogleFonts.plusJakartaSans(
                  fontSize: 16.0, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}

// Ini Container Loyalty sama Pilih Outlet

class ShadowContainer extends StatelessWidget {
  const ShadowContainer({Key? key, required this.child}) : super(key: key);

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade400,
            blurRadius: 3,
          )
        ],
      ),
      child: child,
    );
  }
}

// Ini Navbar

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int currentTab = 0;
  final List<Widget> screens = [
    const MainPage(),
    const OrderPage(),
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = const MainPage();

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 10,
      child: SizedBox(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MaterialButton(
                  minWidth: 40,
                  onPressed: () {
                    setState(() {
                      currentScreen = const MainPage();
                      currentTab = 0;
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.home,
                          color: currentTab == 0
                              ? const Color.fromARGB(255, 224, 194, 139)
                              : Colors.black),
                    ],
                  ),
                ),
                MaterialButton(
                  onPressed: () {
                    setState(
                      () {
                        currentScreen = const OrderPage();
                        currentTab = 1;
                      },
                    );
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.emoji_food_beverage,
                          color: currentTab == 1
                              ? const Color.fromARGB(255, 224, 194, 139)
                              : Colors.black),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class FloatingQR extends StatefulWidget {
  const FloatingQR({Key? key}) : super(key: key);

  @override
  State<FloatingQR> createState() => _FloatingQRState();
}

class _FloatingQRState extends State<FloatingQR> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: const Color.fromARGB(255, 153, 110, 56),
      onPressed: () {},
      child: const Icon(
        Icons.qr_code,
        color: Colors.white,
      ),
    );
  }
}

// ini container buat menu utama

class CoreMenu extends StatefulWidget {
  const CoreMenu({Key? key}) : super(key: key);

  @override
  State<CoreMenu> createState() => _CoreMenuState();
}

class _CoreMenuState extends State<CoreMenu> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 430,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 250, 235),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Order dan lengkapi stampmu',
            style: GoogleFonts.plusJakartaSans(
                fontSize: 16, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 15,
          ),
          const StampCollection(),
          const SizedBox(
            height: 30,
          ),
          Text(
            'Promo Untukmu',
            style: GoogleFonts.plusJakartaSans(
                fontSize: 16, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 15,
          ),
          PromoUntukmu()
        ],
      ),
    );
  }
}

// ini buat stamps
class StampCollection extends StatelessWidget {
  const StampCollection({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> stampcollection = const [
      {"icon": (Icons.add), "text": "Stamp 1"},
      {"icon": (Icons.add), "text": "Stamp 2"},
      {"icon": (Icons.add), "text": "Stamp 3"},
      {"icon": (Icons.add), "text": "Stamp 4"},
      {"icon": (Icons.confirmation_number_outlined), "text": "Free"},
    ];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ...List.generate(
          stampcollection.length,
          (index) => Stamps(
              icon: stampcollection[index]["icon"],
              text: stampcollection[index]["text"],
              press: () {}),
        ),
      ],
    );
  }
}

class Stamps extends StatelessWidget {
  const Stamps(
      {Key? key, required this.icon, required this.text, required this.press})
      : super(key: key);

  final String text;
  final IconData icon;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        children: [
          Container(
            width: 51,
            height: 51,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 244, 225, 182),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: const Color.fromARGB(255, 131, 87, 40)),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(text, textAlign: TextAlign.center),
        ],
      ),
    );
  }
}

class PromoUntukmu extends StatefulWidget {
  const PromoUntukmu({Key? key}) : super(key: key);

  @override
  State<PromoUntukmu> createState() => _PromoUntukmuState();
}

class _PromoUntukmuState extends State<PromoUntukmu> {
  final List<Map<String, dynamic>> foryouMap = [
    {
      "id": "jcug70xkxr",
      "nameMenu": "Arnold33",
      "priceMenu": 78405,
      "descMenu":
          "Facere eius nobis nam ab architecto labore ad aspernatur. Nemo voluptas eos placeat natus ducimus eveniet adipisci. Ea quas repudiandae nesciunt quae.",
      "image": "././assets/image/produk_a.JPG"
    },
    {
      "id": "wpatzytzqc",
      "nameMenu": "Justus.Schimmel",
      "priceMenu": 60341,
      "descMenu":
          "Iste repudiandae in pariatur reprehenderit veritatis at earum officiis. Dolorem inventore quis cumque eligendi ab quisquam perspiciatis. Repellat eligendi eligendi odio autem magnam nostrum. Tempora velit temporibus molestias saepe dicta perferendis. Tempore reprehenderit tempora quo similique fuga eaque ipsam.",
      "image": "././assets/image/produk_b.JPG"
    },
    {
      "id": "o41buwmpky",
      "nameMenu": "Demario_Schuppe",
      "priceMenu": 43604,
      "descMenu":
          "Vitae iure quos esse aliquam labore pariatur non. Ipsam veritatis hic est voluptate. Dignissimos natus corporis dolorem sequi neque. Illum eum vitae et officia. Minus natus ea nulla explicabo accusantium quae tempore.",
      "image": "././assets/image/produk_c.JPG"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: foryouMap.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: InkWell(
              onTap: () {
                setState(() {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return CoffeeArticle(
                      id: "${foryouMap.elementAt(index)['id']}",
                      nameMenu: "${foryouMap.elementAt(index)['nameMenu']}",
                      priceMenu: "${foryouMap.elementAt(index)['priceMenu']}",
                      descMenu: "${foryouMap.elementAt(index)['descMenu']}",
                      image: "${foryouMap.elementAt(index)['image']}",
                    );
                  }));
                });
              },
              child: Container(
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(16.0),
                        topRight: Radius.circular(16.0),
                      ),
                      child: Image.asset(
                        "${foryouMap.elementAt(index)['image']}",
                        height: 170,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Text("${foryouMap.elementAt(index)['nameMenu']}"),
                          const SizedBox(
                            height: 8.0,
                          ),
                          Text("Rp. ${foryouMap.elementAt(index)['priceMenu']}",
                              textAlign: TextAlign.left)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
