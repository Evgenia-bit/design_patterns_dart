import 'package:design_pattern_learning/state/gumball_machine.dart';
import 'package:design_pattern_learning/state/states/i_state.dart';

class SoldOutState implements IState {
  final GumballMachine _gumballMachine;

  SoldOutState(this._gumballMachine);

  @override
  void dispense() {
    print('Шарики закончились');
  }

  @override
  void ejectQuarter() {
    print('Шариков нет');
  }

  @override
  void insertQuarter() {
    print('Шарики закончились');
  }

  @override
  void turnCrank() {
    print('Шарики закончились');
  }
}
