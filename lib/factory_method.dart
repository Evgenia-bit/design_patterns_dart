abstract class PizzaStore {
  Pizza createPizza(String type);

  Pizza orderPizza(String type) {
    final pizza = createPizza(type);

    pizza.prepare();
    pizza.bake();
    pizza.cut();
    pizza.box();
    pizza.deliver();

    return pizza;
  }
}

abstract class Pizza {
  final String name;
  final String dough;
  final String souce;
  final List<String> toppings;

  Pizza({
    required this.name,
    required this.dough,
    required this.souce,
    required this.toppings,
  });

  void prepare() {
    print('Preparing $runtimeType');
  }

  void bake() {
    print('Baking $runtimeType');
  }

  void cut() {
    print('Cutting $runtimeType');
  }

  void box() {
    print('Boxing $runtimeType');
  }

  void deliver() {
    print('Delivering $runtimeType');
  }
}

/// Фабрика нью-йоркской пиццы.

class NYPizzaStore extends PizzaStore {
  @override
  Pizza createPizza(String type) {
    if (type == 'cheese') {
      return NYStyleCheesePizza();
    } else if (type == 'veggie') {
      return NYStyleVeggiePizza();
    }
    return NYStylePepperoniPizza();
  }
}

class NYStyleCheesePizza extends Pizza {
  NYStyleCheesePizza()
      : super(
          name: 'NY Style Sauce and Cheese Pizza',
          dough: 'Thin Crust Dough',
          souce: 'Marinara Sauce',
          toppings: ['Grated Reggiano Cheese'],
        );
}

class NYStyleVeggiePizza extends Pizza {
  NYStyleVeggiePizza()
      : super(
          name: 'NY Style Veggie Pizza',
          dough: 'Thin Crust Dough',
          souce: 'Marinara Sauce',
          toppings: [
            'Grated Reggiano Cheese',
            'Garlic',
            'Onion',
            'Mushrooms',
            'Red Pepper',
          ],
        );
}

class NYStylePepperoniPizza extends Pizza {
  NYStylePepperoniPizza()
      : super(
          name: 'NY Style Pepperoni Pizza',
          dough: 'Thin Crust Dough',
          souce: 'Marinara Sauce',
          toppings: ['Grated Reggiano Cheese', 'Sliced Pepperoni', 'Garlic'],
        );
}

/// Фабрика чикагской пиццы.

class ChicagoPizzaStore extends PizzaStore {
  @override
  Pizza createPizza(String type) {
    if (type == 'cheese') {
      return ChicagoStyleCheesePizza();
    } else if (type == 'veggie') {
      return ChicagoStyleVeggiePizza();
    }
    return ChicagoStylePepperoniPizza();
  }
}

class ChicagoStyleCheesePizza extends Pizza {
  ChicagoStyleCheesePizza()
      : super(
          name: 'Chicago Style Deep Dish Cheese Pizza',
          dough: 'Extra Thick Crust Dough',
          souce: 'Plum Tomato Sauce',
          toppings: ['Shredded Mozzarella Cheese'],
        );

  @override
  void cut() {
    print('Cutting pizza into square slices');
  }
}

class ChicagoStyleVeggiePizza extends Pizza {
  ChicagoStyleVeggiePizza()
      : super(
          name: 'Chicago Style Veggie Pizza',
          dough: 'Extra Thick Crust Dough',
          souce: 'Plum Tomato Sauce',
          toppings: [
            'Shredded Mozzarella Cheese',
            'Black Olives',
            'Spinach',
            'Eggplant',
          ],
        );
}

class ChicagoStylePepperoniPizza extends Pizza {
  ChicagoStylePepperoniPizza()
      : super(
          name: 'Chicago Style Pepperoni Pizza',
          dough: 'Extra Thick Crust Dough',
          souce: 'Plum Tomato Sauce',
          toppings: ['Shredded Mozzarella Cheese', 'Black Olives', 'Spinach'],
        );
}
