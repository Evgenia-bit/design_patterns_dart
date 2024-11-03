import 'package:design_pattern_learning/iterator/menu_item.dart';
import 'package:design_pattern_learning/iterator/interfaces/my_iterator.dart';

class DinerMenuIterator implements MyIterator {
  final Map<int, MenuItem> _items;
  int _position = 0;

  DinerMenuIterator(this._items);

  @override
  bool hasNext() {
    return _position != _items.length - 1;
  }

  @override
  MenuItem? next() {
    MenuItem? menuItem = _items[_position];
    _position = _position + 1;
    return menuItem;
  }
}
