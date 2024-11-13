import 'package:design_pattern_learning/composite/i_menu_component.dart';

class MenuItem extends IMenuComponent {
  @override
  final String name;
  @override
  final String description;

  @override
  final bool isVegetarian;

  @override
  final double price;

  MenuItem(this.name, this.description, this.isVegetarian, this.price);

  @override
  void menuPrint() {
    print(name);
    if (isVegetarian) {
      print('(v)');
    }
    print(', $price');
    print('     -- $description');
  }
}
