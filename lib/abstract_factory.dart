abstract class PizzaStore {
  Pizza createPizza(String type);

  Pizza orderPizza(String type) {
    final pizza = createPizza(type);

    pizza.prepare();
    pizza.bake();
    pizza.cut();
    pizza.box();

    return pizza;
  }
}

/// Абстрактная фабрика для ингридиентов.
abstract class IngridientFactory {
  Dough createDough();
  Sauce createSauce();
  Cheese createCheese();
  Clams createClams();
}

/// Абстрактные классы ингридиентов.

abstract class Sauce {}

abstract class Dough {}

abstract class Cheese {}

abstract class Clams {}

/// Конкретные классы ингридиентов.

class ReggianoCheese extends Cheese {}

class MozzarellaCheese extends Cheese {}

class FreshClams extends Clams {}

class FreezedClams extends Clams {}

class ThinCrustDough extends Dough {}

class ThickCrustDough extends Dough {}

class MarinaraSauce extends Sauce {}

class MargaritaSauce extends Sauce {}

/// Фабрика для ню-йоркских ингридиентов.
class NYIngridientFactory implements IngridientFactory {
  @override
  Cheese createCheese() {
    return ReggianoCheese();
  }

  @override
  Clams createClams() {
    return FreshClams();
  }

  @override
  Dough createDough() {
    return ThinCrustDough();
  }

  @override
  Sauce createSauce() {
    return MarinaraSauce();
  }
}

/// Фабрика для чикагских ингридиентов.
class ChicagoIngridientFactory implements IngridientFactory {
  @override
  Cheese createCheese() {
    return MozzarellaCheese();
  }

  @override
  Clams createClams() {
    return FreezedClams();
  }

  @override
  Dough createDough() {
    return ThickCrustDough();
  }

  @override
  Sauce createSauce() {
    return MargaritaSauce();
  }
}

/// Абстрактный класс пиццы.
abstract class Pizza {
  late Cheese cheese;
  late Dough dough;
  late Sauce souce;
  late Clams? clams;

  void prepare();

  void bake() {
    print('Bake for 25 minutes at 350');
  }

  void cut() {
    print('Cutting the pizza into diagonal slices');
  }

  void box() {
    print('Place pizza in official PizzaStore box');
  }
}

/// Пицца с сыром.
class CheesePizza extends Pizza {
  final IngridientFactory ingridientFactory;
  CheesePizza(this.ingridientFactory);

  @override
  void prepare() {
    cheese = ingridientFactory.createCheese();
    dough = ingridientFactory.createDough();
    souce = ingridientFactory.createSauce();
  }
}

/// Пицца с мидиями.
class ClamPizza extends Pizza {
  final IngridientFactory ingridientFactory;
  ClamPizza(this.ingridientFactory);

  @override
  void prepare() {
    cheese = ingridientFactory.createCheese();
    dough = ingridientFactory.createDough();
    souce = ingridientFactory.createSauce();
    clams = ingridientFactory.createClams();
  }
}

class NYPizzaStore extends PizzaStore {
  @override
  Pizza createPizza(String type) {
    final ingridientFactory = NYIngridientFactory();

    if (type == 'cheese') {
      return CheesePizza(ingridientFactory);
    }
    return ClamPizza(ingridientFactory);
  }
}

class ChicagoPizzaStore extends PizzaStore {
  @override
  Pizza createPizza(String type) {
    final ingridientFactory = ChicagoIngridientFactory();

    if (type == 'cheese') {
      return CheesePizza(ingridientFactory);
    }
    return ClamPizza(ingridientFactory);
  }
}
