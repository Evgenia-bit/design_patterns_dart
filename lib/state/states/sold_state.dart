import 'package:design_pattern_learning/state/gumball_machine.dart';
import 'package:design_pattern_learning/state/states/i_state.dart';

class SoldState implements IState {
  final GumballMachine _gumballMachine;

  SoldState(this._gumballMachine);

  @override
  void dispense() {
    print('Выдается шарик');
  }

  @override
  void ejectQuarter() {
    print('Шарик уже выдается');
  }

  @override
  void insertQuarter() {
    print('Подождите, шарик выдается');
  }

  @override
  void turnCrank() {
    _gumballMachine.releaseBall();
    if(_gumballMachine.count > 0) {
      _gumballMachine.currentState = _gumballMachine.noQuarterState;
    } else {
      print('Шарики закончились');
      _gumballMachine.currentState = _gumballMachine.soldOutState;
    }
  }
}
