import 'package:design_pattern_learning/iterator/interfaces/my_iterable.dart';
import 'package:design_pattern_learning/iterator/interfaces/my_iterator.dart';

class Waitress {
  final List<MyIterable> _menus;

  Waitress(this._menus);

  void printMenu() {
    for (final menu in _menus) {
      _printMenu(menu.iterator);
    }
  }

  void _printMenu(MyIterator iterator) {
    while (iterator.hasNext()) {
      print(iterator.next());
    }
  }
}
