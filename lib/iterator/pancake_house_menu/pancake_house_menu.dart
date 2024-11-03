import 'package:design_pattern_learning/iterator/interfaces/my_iterable.dart';
import 'package:design_pattern_learning/iterator/interfaces/my_iterator.dart';
import 'package:design_pattern_learning/iterator/menu_item.dart';
import 'package:design_pattern_learning/iterator/pancake_house_menu/pancake_house_menu_iterator.dart';

class PancakeHouseMenu implements MyIterable {
  final List<MenuItem> menuItems = [];

  PancakeHouseMenu() {
    menuItems.add(
      MenuItem(
        'K&B\'s Pancake Breakfast',
        'Pancakes with scrambled eggs, and toast',
        true,
        2.99,
      ),
    );
    menuItems.add(
      MenuItem(
        'Regular Pancake Breakfast',
        'Pancakes with fried eggs, sausage',
        false,
        2.99,
      ),
    );
    menuItems.add(
      MenuItem(
        'Blueberry Pancakes',
        'Pancakes made with fresh blueberries',
        true,
        3.49,
      ),
    );
    menuItems.add(
      MenuItem(
        'Waffles',
        'Waffles, with your choice of blueberries or strawberries',
        true,
        3.59,
      ),
    );
  }

  List<MenuItem> getMenuItems() {
    return menuItems;
  }

  @override
  MyIterator get iterator {
    return PancakeHouseMenuIterator(menuItems);
  }
}
