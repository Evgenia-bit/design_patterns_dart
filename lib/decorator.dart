abstract class Beverage {
  String get description;

  double cost();
}

class DarkRoast extends Beverage {
  @override
  String get description => 'Dart Roast';

  @override
  double cost() {
    return 1.99;
  }
}

class Espresso extends Beverage {
  @override
  String get description => 'Espresso';

  @override
  double cost() {
    return 1.99;
  }
}

class HouseBlend extends Beverage {
  @override
  String get description => 'House Blend Coffee';

  @override
  double cost() {
    return 0.89;
  }
}

abstract class CondimentDecorator extends Beverage {
  final Beverage beverage;

  CondimentDecorator(this.beverage);
}

class Mocha extends CondimentDecorator {
  Mocha(Beverage beverage) : super(beverage);

  @override
  String get description => '${beverage.description}, Mocha';

  @override
  double cost() {
    return 0.20 + beverage.cost();
  }
}

class Soy extends CondimentDecorator {
  Soy(Beverage beverage) : super(beverage);

  @override
  String get description => '${beverage.description}, Soy';

  @override
  double cost() {
    if (beverage is HouseBlend) {
      return 0.1 + beverage.cost();
    }
    return 0.15 + beverage.cost();
  }
}

class Whip extends CondimentDecorator {
  Whip(Beverage beverage) : super(beverage);

  @override
  String get description => '${beverage.description}, Whip';

  @override
  double cost() {
    return 0.10 + beverage.cost();
  }
}
