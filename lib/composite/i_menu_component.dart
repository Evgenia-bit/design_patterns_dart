/// Интерфейс для компонента меню.
///
/// Его реализуют как блюда в меню (листья), так и целые меню (составные объекты).
abstract class IMenuComponent {
  void add(IMenuComponent menuComponent) => throw UnimplementedError();
  void remove(IMenuComponent menuComponent) => throw UnimplementedError();
  IMenuComponent getChild(int i) => throw UnimplementedError();
  String get name => throw UnimplementedError();
  String get description => throw UnimplementedError();
  double get price => throw UnimplementedError();
  bool get isVegetarian => throw UnimplementedError();
  void menuPrint() => throw UnimplementedError();
}
