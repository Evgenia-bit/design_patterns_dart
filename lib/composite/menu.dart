import 'package:design_pattern_learning/composite/i_menu_component.dart';

class Menu extends IMenuComponent {
  final List<IMenuComponent> menuComponents = [];
  @override
  final String name;
  @override
  final String description;

  Menu(this.name, this.description);

  @override
  void add(IMenuComponent menuComponent) {
    menuComponents.add(menuComponent);
  }

  @override
  void remove(IMenuComponent menuComponent) {
    menuComponents.remove(menuComponent);
  }

  @override
  IMenuComponent getChild(int i) => menuComponents[i];

  @override
  void menuPrint() {
    print('\n$name, $description\n---------------------');
    for (final menuComponent in menuComponents) {
      menuComponent.menuPrint();
    }
  }
}
