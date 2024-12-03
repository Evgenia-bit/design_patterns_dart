import 'package:design_pattern_learning/state/gumball_machine.dart';
import 'package:design_pattern_learning/state/states/i_state.dart';

class HasQuarterState implements IState {
  final GumballMachine _gumballMachine;

  HasQuarterState(this._gumballMachine);

  @override
  void dispense() {
    print('Нельзя выдать шарик');
  }

  @override
  void ejectQuarter() {
    print('Монета возвращена');
    _gumballMachine.currentState = _gumballMachine.noQuarterState;
  }

  @override
  void insertQuarter() {
    print('Монета уже вставлена');
  }

  @override
  void turnCrank() {
    print('Поворот...');
    _gumballMachine.currentState = _gumballMachine.soldState;
  }
}