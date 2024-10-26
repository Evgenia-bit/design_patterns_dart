import 'package:meta/meta.dart';

abstract class CoffeineBeverage {
  /// Шаблонный метод.
  @nonVirtual
  void prepareRecipe() {
    boilWater();
    brew();
    pourInCup();
    addCondiments();
    if (customerWantsCondiments()) {
      addCondiments();
    }
  }

  /// Шаг алгоритма, который определяется в базовом классе.
  @nonVirtual
  void boilWater() {
    print('Boiling water');
  }

  /// Шаг алгоритма, который определяется в подклассе.
  void brew();

  /// Шаг алгоритма, который определяется в базовом классе.
  @nonVirtual
  void pourInCup() {
    print('Pouring into cup');
  }

  /// Шаг алгоритма, который определяется в подклассе.
  void addCondiments();

  /// Метод-перехватчик. Подклассы могут опционально переопределить этот метод.
  bool customerWantsCondiments() {
    return true;
  }
}

class Tea extends CoffeineBeverage {
  @override
  void brew() {
    print('Steeping the tea');
  }

  @override
  void addCondiments() {
    print('Adding Lemon');
  }

  @override
  bool customerWantsCondiments() {
    return false;
  }
}

class Coffee extends CoffeineBeverage {
  @override
  void brew() {
    print('Dripping Coffee through filter');
  }

  @override
  void addCondiments() {
    print('Adding Sugar and Milk');
  }
}
