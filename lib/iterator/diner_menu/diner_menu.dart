import 'package:design_pattern_learning/iterator/diner_menu/diner_menu_iterator.dart';
import 'package:design_pattern_learning/iterator/interfaces/my_iterable.dart';
import 'package:design_pattern_learning/iterator/interfaces/my_iterator.dart';
import 'package:design_pattern_learning/iterator/menu_item.dart';

class DinerMenu implements MyIterable {
  final int maxItems = 6;
  int numberOfItems = 0;
  final Map<int, MenuItem> menuItems = {};

  DinerMenu() {
    addItem(
      'Vegetarian BLT',
      '(Fakin\') Bacon with lettuce & tomato on whole wheat',
      true,
      2.99,
    );
    addItem(
      'BLT',
      'Bacon with lettuce & tomato on whole wheat',
      false,
      2.99,
    );
    addItem(
      'Soup of the day',
      'Soup of the day, with a side of potato salad',
      false,
      3.29,
    );
    addItem(
      'Hotdog',
      'A hot dog, with saurkraut, relish, onions, topped with cheese',
      false,
      3.05,
    );
  }

  void addItem(String name, String description, bool vegetarian, double price) {
    final MenuItem menuItem = MenuItem(name, description, vegetarian, price);

    if (numberOfItems >= maxItems) {
      print('Sorry, menu is full! Can\'t add item to menu');
    } else {
      menuItems[numberOfItems] = menuItem;
      numberOfItems++;
    }
  }

  Map<int, MenuItem> getMenuItems() {
    return menuItems;
  }

  @override
  MyIterator get iterator {
    return DinerMenuIterator(menuItems);
  }
}
