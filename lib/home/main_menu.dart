import 'package:flutter/material.dart';
import 'package:papb/home/main_page.dart';

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
      onTap: () {},
      child: ShadowContainer(
        child: SizedBox(
          width: double.infinity,
          height: 50,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Ngopeee Km.10',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text('Jalan bla bla bla'),
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
          children: const [
            Text('Loyalty'),
            Spacer(),
            Text('Level 1'),
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
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Colors.black,
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
                              : Colors.transparent),
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
      child: const Icon(
        Icons.qr_code,
        color: Colors.white,
      ),
      backgroundColor: const Color.fromARGB(255, 153, 110, 56),
      onPressed: () {},
    );
  }
}
