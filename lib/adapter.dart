class Duck {
  void quack() {
    print('Quack');
  }

  void swim() {
    print('Swim');
  }
}

class Turkey {
  void gobble() {
    print('Gobble');
  }

  void fly() {
    print('Fly');
  }
}

class TurkeyAdapter extends Duck {
  final Turkey _turkey;

  TurkeyAdapter(this._turkey);

  @override
  void quack() {
    _turkey.gobble();
  }

  @override
  void swim() {
    _turkey.fly();
  }
}
