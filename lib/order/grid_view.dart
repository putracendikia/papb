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
        return InkWell(
          onTap: () {
            setState(() {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return CoffeeArticle(
                  id: "${gridMap.elementAt(index)['id']}",
                  nameMenu: "${gridMap.elementAt(index)['nameMenu']}",
                  priceMenu: "${gridMap.elementAt(index)['priceMenu']}",
                  descMenu: "${gridMap.elementAt(index)['descMenu']}",
                  image: "${gridMap.elementAt(index)['image']}",
                );
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
                    "${gridMap.elementAt(index)['image']}",
                    height: 170,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Text("${gridMap.elementAt(index)['nameMenu']}"),
                      const SizedBox(
                        height: 8.0,
                      ),
                      Text("Rp. ${gridMap.elementAt(index)['priceMenu']}",
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
