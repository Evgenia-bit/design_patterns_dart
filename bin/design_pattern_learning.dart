import 'package:design_pattern_learning/adapter.dart';
import 'package:design_pattern_learning/command.dart';
import 'package:design_pattern_learning/decorator.dart';
import 'package:design_pattern_learning/facade.dart';
import 'package:design_pattern_learning/visitor.dart';

void main() {
  _testVisitor();
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
