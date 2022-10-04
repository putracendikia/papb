// import 'package:flutter/material.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:papb/home/main_menu.dart';
// import 'package:papb/home/main_page.dart';
// import 'package:papb/order/order_page.dart';

// class Core extends StatefulWidget {
//   const Core({Key? key}) : super(key: key);

//   @override
//   State<Core> createState() => _CoreState();
// }

// class _CoreState extends State<Core> {
//   // Properties
//   int currentTab = 0;
//   final List<Widget> screens = [
//     MainPage(),
//     OrderPage(),
//   ];

//   Widget currentScreen = MainPage();
//   final PageStorageBucket bucket = PageStorageBucket();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: PageStorage(bucket: bucket, child: currentScreen),
//       floatingActionButton: const FloatingQR(),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//       bottomNavigationBar: BottomAppBar(
//         shape: const CircularNotchedRectangle(),
//         notchMargin: 10,
//         child: SizedBox(
//           height: 60,
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   MaterialButton(
//                     minWidth: 40,
//                     onPressed: () {
//                       setState(() {
//                         currentScreen = const MainPage();
//                         currentTab = 0;
//                       });
//                     },
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Icon(Icons.home,
//                             color: currentTab == 0
//                                 ? const Color.fromARGB(255, 224, 194, 139)
//                                 : Colors.black),
//                       ],
//                     ),
//                   ),
//                   MaterialButton(
//                     onPressed: () {
//                       setState(
//                         () {
//                           currentScreen = const OrderPage();
//                           currentTab = 1;
//                         },
//                       );
//                     },
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Icon(Icons.emoji_food_beverage,
//                             color: currentTab == 1
//                                 ? const Color.fromARGB(255, 224, 194, 139)
//                                 : Colors.black),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
