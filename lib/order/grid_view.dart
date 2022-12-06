import 'package:flutter/material.dart';
import 'package:papb/produk/coffeearticle.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:papb/entities/datamenu.dart';
class GridMenu extends StatefulWidget {
  const GridMenu({Key? key}) : super(key: key);

  @override
  State<GridMenu> createState() => _GridMenuState();
}

class _GridMenuState extends State<GridMenu> {
  late Future<List<Menu>> futureMenu;
  List<String> keranjang = [];
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
        {
      "id": "o41buwmpky",
      "nameMenu": "Demario_Schuppe",
      "priceMenu": 43604,
      "descMenu":
          "Vitae iure quos esse aliquam labore pariatur non. Ipsam veritatis hic est voluptate. Dignissimos natus corporis dolorem sequi neque. Illum eum vitae et officia. Minus natus ea nulla explicabo accusantium quae tempore.",
      "image": "././assets/image/produk_c.JPG"
    },    {
      "id": "o41buwmpky",
      "nameMenu": "Demario_Schuppe",
      "priceMenu": 43604,
      "descMenu":
          "Vitae iure quos esse aliquam labore pariatur non. Ipsam veritatis hic est voluptate. Dignissimos natus corporis dolorem sequi neque. Illum eum vitae et officia. Minus natus ea nulla explicabo accusantium quae tempore.",
      "image": "././assets/image/produk_c.JPG"
    },    {
      "id": "o41buwmpky",
      "nameMenu": "Demario_Schuppe",
      "priceMenu": 43604,
      "descMenu":
          "Vitae iure quos esse aliquam labore pariatur non. Ipsam veritatis hic est voluptate. Dignissimos natus corporis dolorem sequi neque. Illum eum vitae et officia. Minus natus ea nulla explicabo accusantium quae tempore.",
      "image": "././assets/image/produk_c.JPG"
    },    {
      "id": "o41buwmpky",
      "nameMenu": "Demario_Schuppe",
      "priceMenu": 43604,
      "descMenu":
          "Vitae iure quos esse aliquam labore pariatur non. Ipsam veritatis hic est voluptate. Dignissimos natus corporis dolorem sequi neque. Illum eum vitae et officia. Minus natus ea nulla explicabo accusantium quae tempore.",
      "image": "././assets/image/produk_c.JPG"
    },    {
      "id": "o41buwmpky",
      "nameMenu": "Demario_Schuppe",
      "priceMenu": 43604,
      "descMenu":
          "Vitae iure quos esse aliquam labore pariatur non. Ipsam veritatis hic est voluptate. Dignissimos natus corporis dolorem sequi neque. Illum eum vitae et officia. Minus natus ea nulla explicabo accusantium quae tempore.",
      "image": "././assets/image/produk_c.JPG"
    },    {
      "id": "o41buwmpky",
      "nameMenu": "Demario_Schuppe",
      "priceMenu": 43604,
      "descMenu":
          "Vitae iure quos esse aliquam labore pariatur non. Ipsam veritatis hic est voluptate. Dignissimos natus corporis dolorem sequi neque. Illum eum vitae et officia. Minus natus ea nulla explicabo accusantium quae tempore.",
      "image": "././assets/image/produk_c.JPG"
    },    {
      "id": "o41buwmpky",
      "nameMenu": "Demario_Schuppe",
      "priceMenu": 43604,
      "descMenu":
          "Vitae iure quos esse aliquam labore pariatur non. Ipsam veritatis hic est voluptate. Dignissimos natus corporis dolorem sequi neque. Illum eum vitae et officia. Minus natus ea nulla explicabo accusantium quae tempore.",
      "image": "././assets/image/produk_c.JPG"
    },    {
      "id": "o41buwmpky",
      "nameMenu": "Demario_Schuppe",
      "priceMenu": 43604,
      "descMenu":
          "Vitae iure quos esse aliquam labore pariatur non. Ipsam veritatis hic est voluptate. Dignissimos natus corporis dolorem sequi neque. Illum eum vitae et officia. Minus natus ea nulla explicabo accusantium quae tempore.",
      "image": "././assets/image/produk_c.JPG"
    },    {
      "id": "o41buwmpky",
      "nameMenu": "Demario_Schuppe",
      "priceMenu": 43604,
      "descMenu":
          "Vitae iure quos esse aliquam labore pariatur non. Ipsam veritatis hic est voluptate. Dignissimos natus corporis dolorem sequi neque. Illum eum vitae et officia. Minus natus ea nulla explicabo accusantium quae tempore.",
      "image": "././assets/image/produk_c.JPG"
    },    {
      "id": "o41buwmpky",
      "nameMenu": "Demario_Schuppe",
      "priceMenu": 43604,
      "descMenu":
          "Vitae iure quos esse aliquam labore pariatur non. Ipsam veritatis hic est voluptate. Dignissimos natus corporis dolorem sequi neque. Illum eum vitae et officia. Minus natus ea nulla explicabo accusantium quae tempore.",
      "image": "././assets/image/produk_c.JPG"
    },    {
      "id": "o41buwmpky",
      "nameMenu": "Demario_Schuppe",
      "priceMenu": 43604,
      "descMenu":
          "Vitae iure quos esse aliquam labore pariatur non. Ipsam veritatis hic est voluptate. Dignissimos natus corporis dolorem sequi neque. Illum eum vitae et officia. Minus natus ea nulla explicabo accusantium quae tempore.",
      "image": "././assets/image/produk_c.JPG"
    },    {
      "id": "o41buwmpky",
      "nameMenu": "Demario_Schuppe",
      "priceMenu": 43604,
      "descMenu":
          "Vitae iure quos esse aliquam labore pariatur non. Ipsam veritatis hic est voluptate. Dignissimos natus corporis dolorem sequi neque. Illum eum vitae et officia. Minus natus ea nulla explicabo accusantium quae tempore.",
      "image": "././assets/image/produk_c.JPG"
    },    {
      "id": "o41buwmpky",
      "nameMenu": "Demario_Schuppe",
      "priceMenu": 43604,
      "descMenu":
          "Vitae iure quos esse aliquam labore pariatur non. Ipsam veritatis hic est voluptate. Dignissimos natus corporis dolorem sequi neque. Illum eum vitae et officia. Minus natus ea nulla explicabo accusantium quae tempore.",
      "image": "././assets/image/produk_c.JPG"
    },    {
      "id": "o41buwmpky",
      "nameMenu": "Demario_Schuppe",
      "priceMenu": 43604,
      "descMenu":
          "Vitae iure quos esse aliquam labore pariatur non. Ipsam veritatis hic est voluptate. Dignissimos natus corporis dolorem sequi neque. Illum eum vitae et officia. Minus natus ea nulla explicabo accusantium quae tempore.",
      "image": "././assets/image/produk_c.JPG"
    },    {
      "id": "o41buwmpky",
      "nameMenu": "Demario_Schuppe",
      "priceMenu": 43604,
      "descMenu":
          "Vitae iure quos esse aliquam labore pariatur non. Ipsam veritatis hic est voluptate. Dignissimos natus corporis dolorem sequi neque. Illum eum vitae et officia. Minus natus ea nulla explicabo accusantium quae tempore.",
      "image": "././assets/image/produk_c.JPG"
    },    {
      "id": "o41buwmpky",
      "nameMenu": "Demario_Schuppe",
      "priceMenu": 43604,
      "descMenu":
          "Vitae iure quos esse aliquam labore pariatur non. Ipsam veritatis hic est voluptate. Dignissimos natus corporis dolorem sequi neque. Illum eum vitae et officia. Minus natus ea nulla explicabo accusantium quae tempore.",
      "image": "././assets/image/produk_c.JPG"
    },    {
      "id": "o41buwmpky",
      "nameMenu": "Demario_Schuppe",
      "priceMenu": 43604,
      "descMenu":
          "Vitae iure quos esse aliquam labore pariatur non. Ipsam veritatis hic est voluptate. Dignissimos natus corporis dolorem sequi neque. Illum eum vitae et officia. Minus natus ea nulla explicabo accusantium quae tempore.",
      "image": "././assets/image/produk_c.JPG"
    },
  ];

  @override
  void initState(){
    super.initState();
    futureMenu = fetchMenu();
  }

  Widget build(BuildContext context) {
    return FutureBuilder <List<Menu>>(
      future : fetchMenu(),
      builder:(context,snapshot) {
        if(snapshot.hasData){
          return GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  mainAxisExtent: 250),
              itemCount: snapshot.data!.length,
              itemBuilder: (BuildContext context, index) {
                return InkWell(
                  onTap: () {
                    setState(() {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return CoffeeArticle(
                          id: snapshot.data![index].id,
                          nameMenu: snapshot.data![index].nameMenu,
                          priceMenu: snapshot.data![index].price.toString(),
                          descMenu:  snapshot.data![index].descMenu,
                          image: "${gridMap.elementAt(0)['image']}",
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
                              Text(snapshot.data![index].nameMenu),
                              const SizedBox(
                                height: 8.0,
                              ),
                              Text("Rp. ${snapshot.data![index].price}",
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
        }else if (snapshot.hasError){
          return Text('${snapshot.error}');
        }
        return const CircularProgressIndicator();
      },
    );
  }
}
Future<List<Menu>> fetchMenu() async {
  final response = await http.get(Uri.parse('http://103.187.146.72:3000/api/ngopeee'));
  if(response.statusCode == 200) {
    // dynamic result = jsonDecode(response);
    // print(response.body);
    List result = jsonDecode(response.body);
    return result.map((e) => Menu.fromJson(e)).toList();
  }else{
    throw Exception('Failed Load Menu');
  }
}


