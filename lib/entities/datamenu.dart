class Menu {
  final String id;
  final String nameMenu;
  final int price;
  final String descMenu;


  const Menu({
    required this.id,
    required this.nameMenu,
    required this.price,
    required this.descMenu
  });

  factory Menu.fromJson(Map<String,dynamic>json) {
    return Menu(
      id : json['id'],
      nameMenu: json['nameMenu'],
      price: json['priceMenu'],
      descMenu: json['descMenu']
    );
  }
}