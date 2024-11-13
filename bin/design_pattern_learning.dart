import 'package:design_pattern_learning/adapter.dart';
import 'package:design_pattern_learning/command.dart';
import 'package:design_pattern_learning/composite/composite.dart' as composite;
import 'package:design_pattern_learning/decorator.dart';
import 'package:design_pattern_learning/facade.dart';
import 'package:design_pattern_learning/iterator/diner_menu/diner_menu.dart';
import 'package:design_pattern_learning/iterator/pancake_house_menu/pancake_house_menu.dart';
import 'package:design_pattern_learning/iterator/waitress.dart';
import 'package:design_pattern_learning/visitor.dart';

void main() {
  _testComposite();
}

void _testDecorator() {
  Beverage espresso = Espresso();
  print('${espresso.description} \$${espresso.cost()}');

  Beverage darkRoast = DarkRoast();
  darkRoast = Mocha(darkRoast);
  darkRoast = Mocha(darkRoast);
  darkRoast = Whip(darkRoast);
  print('${darkRoast.description} \$${darkRoast.cost()}');

  Beverage houseBlend = HouseBlend();
  houseBlend = Soy(houseBlend);
  houseBlend = Mocha(houseBlend);
  houseBlend = Whip(houseBlend);
  print('${houseBlend.description} \$${houseBlend.cost()}');
}

void _testCommand() {
  /// Реализация с классом Command;
  final lightOnCommand = LightOnCommand(Light());
  final lightOffCommand = LightOffCommand(Light());

  RemoteControl remoteController = RemoteControl();
  remoteController.setCommand(0, lightOnCommand, lightOffCommand);
  remoteController.pressOnButton(0);
  remoteController.pressOffButton(0);
}

void _testAdapter() {
  final turkey = Turkey();
  Duck turkeyAdapter = TurkeyAdapter(turkey);

  turkeyAdapter.quack();
  turkeyAdapter.swim();
}

void _testFacade() {
  final homeTheater = HomeTheaterFacade(
    Amplifier(),
    Tuner(),
    DvdPlayer(),
    CdPlayer(),
  );
  homeTheater.watchMovie('Raiders of the Lost Ark');
  homeTheater.endMovie();
  homeTheater.listenToCd('The Wall');
  homeTheater.endCd();
  homeTheater.listenToRadio(102.3);
}

void _testVisitor() {
  final visitor = HtmlExportVisitor();
  final blocks = [HeadingBlock(), ListBlock(), ParagraphBlock()];

  var result = '';

  for (var block in blocks) {
    result += block.accept(visitor);
  }

  print(result);
}

void _testIterator() {
  final waitress = Waitress([PancakeHouseMenu(), DinerMenu()]);

  waitress.printMenu();
}

void _testComposite() {
  final dinerMenu = composite.Menu('Diner Menu', 'Breakfast');
  dinerMenu.add(
    composite.MenuItem(
      'Vegetarian BLT',
      'Bacon with lettuce & tomato on whole wheat',
      true,
      2.99,
    ),
  );
  dinerMenu.add(
    composite.MenuItem(
      'Pancake',
      'Pancake with syrup',
      false,
      2.99,
    ),
  );
  dinerMenu.add(
    composite.MenuItem(
      'Waffles',
      'Waffles with blueberries',
      true,
      3.59,
    ),
  );

  final pancakeHouseMenu = composite.Menu('Pancake House Menu', 'Breakfast');

  pancakeHouseMenu.add(
    composite.MenuItem(
      'K&B\'s Pancake Breakfast',
      'Pancake with scrambled eggs, and toast',
      true,
      2.99,
    ),
  );
  pancakeHouseMenu.add(
    composite.MenuItem(
      'Regular Pancake Breakfast',
      'Pancake with fried eggs, sausage',
      false,
      2.99,
    ),
  );

  final dessertMenu = composite.Menu('Dessert Menu', 'Dessert of course!');

  dessertMenu.add(
    composite.MenuItem(
      'Apple Pie',
      'Apple pie with a flakey crust',
      true,
      1.59,
    ),
  );

  dinerMenu.add(dessertMenu);

  final waitress = composite.Waitress([
    dinerMenu,
    pancakeHouseMenu,
  ]);

  waitress.printMenu();
}
