import 'package:design_pattern_learning/state/gumball_machine.dart';
import 'package:design_pattern_learning/state/states/i_state.dart';

class NoQuarterState implements IState {
  final GumballMachine _gumballMachine;

  NoQuarterState(this._gumballMachine);

  @override
  void dispense() {
    print('Шарик выдается только за монету');
  }

  @override
  void ejectQuarter() {
    print('Чтобы вернуть монету, нужно ее сначала бросить');
  }

  @override
  void insertQuarter() {
    print('Монета вставлена');
    _gumballMachine.currentState = _gumballMachine.hasQuarterState;
  }

  @override
  void turnCrank() {
    print('Вы повернули, но монеты нет');
  }
}
