import 'package:design_pattern_learning/composite/i_menu_component.dart';

class Waitress {
  final List<IMenuComponent> _menus;

  Waitress(this._menus);

  void printMenu() {
    for (final menu in _menus) {
      menu.menuPrint();
    }
  }
}
