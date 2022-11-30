import 'package:flutter/material.dart';
import 'package:papb/produk/coffeearticle.dart';

class GridMenu extends StatefulWidget {
  const GridMenu({Key? key}) : super(key: key);

  @override
  State<GridMenu> createState() => _GridMenuState();
}

class _GridMenuState extends State<GridMenu> {
  final List<Map<String, dynamic>> gridMap = [
    {
      "title": "Lorem Ipsum",
      "price": "Rp. 15.000",
      "images": "assets/image/produk_a.JPG",
    },
    {
      "title": "Lorem Ipsum",
      "price": "Rp. 15.000",
      "images": "assets/image/produk_b.JPG",
    },
    {
      "title": "Lorem Ipsum",
      "price": "Rp. 15.000",
      "images": "assets/image/produk_c.JPG",
    },
    {
      "title": "Lorem Ipsum",
      "price": "Rp. 15.000",
      "images": "assets/image/produk_d.JPG",
    },
    {
      "title": "Lorem Ipsum",
      "price": "Rp. 15.000",
      "images": "assets/image/produk_e.JPG",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          mainAxisExtent: 250),
      itemCount: gridMap.length,
      itemBuilder: (_, index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const CoffeeArticle();
              }));
            });
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.white,
              // boxShadow: [
              //   BoxShadow(color: Colors.grey, blurRadius: 2.0),
              // ],
            ),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16.0),
                    topRight: Radius.circular(16.0),
                  ),
                  child: Image.asset(
                    "${gridMap.elementAt(index)['images']}",
                    height: 170,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Text("${gridMap.elementAt(index)['title']}"),
                      const SizedBox(
                        height: 8.0,
                      ),
                      Text("${gridMap.elementAt(index)['price']}",
                          textAlign: TextAlign.left)
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
