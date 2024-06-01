abstract class Duck {
  FlyBehavior _flyBehavior;
  set flyBehavior(FlyBehavior value) {
    _flyBehavior = value;
  }

  QuackBehavior _quackBehavior;
  set quackBehavior(QuackBehavior value) {
    _quackBehavior = value;
  }

  Duck(this._flyBehavior, this._quackBehavior);

  void performFly() {
    _flyBehavior.fly();
  }

  void performQuack() {
    _quackBehavior.quack();
  }

  void display();

  void swim() {
    print('All ducks float, even decoys!');
  }
}

abstract interface class FlyBehavior {
  void fly();
}

class FlyWithWings implements FlyBehavior {
  @override
  void fly() {
    print('I\'m flying!');
  }
}

class FlyNoWay implements FlyBehavior {
  @override
  void fly() {
    print('I can\'t fly');
  }
}

class FlyRocketPowered implements FlyBehavior {
  @override
  void fly() {
    print('I\'m flying with a rocket!');
  }
}

abstract interface class QuackBehavior {
  void quack();
}

class Quack implements QuackBehavior {
  @override
  void quack() {
    print('Quack');
  }
}

class Squeak implements QuackBehavior {
  @override
  void quack() {
    print('Squeak');
  }
}

class MuteQuack implements QuackBehavior {
  @override
  void quack() {
    print('<< Silence >>');
  }
}

class MallardDuck extends Duck {
  MallardDuck()
      : super(
          FlyWithWings(),
          Quack(),
        );

  @override
  void display() {
    print('I\'m a real Mallard duck');
  }
}

class ModelDuck extends Duck {
  ModelDuck()
      : super(
          FlyNoWay(),
          Quack(),
        );

  @override
  void display() {
    print('I\'m a model duck');
  }
}
