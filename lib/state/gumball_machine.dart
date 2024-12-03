import 'package:design_pattern_learning/state/states/has_quarter_state.dart';
import 'package:design_pattern_learning/state/states/i_state.dart';
import 'package:design_pattern_learning/state/states/no_quarter_state.dart';
import 'package:design_pattern_learning/state/states/sold_out_state.dart';
import 'package:design_pattern_learning/state/states/sold_state.dart';

class GumballMachine {
  late final HasQuarterState hasQuarterState;
  late final NoQuarterState noQuarterState;
  late final SoldOutState soldOutState;
  late final SoldState soldState;
  late IState _currentState;
  int _count;

  GumballMachine(int count) : _count = count {
    if (count > 0) {
      _currentState = SoldState(this);
    } else {
      _currentState = SoldOutState(this);
    }
  }

  set currentState(IState state) {
    _currentState = state;
  }

  int get count => _count;

  void insertQuarter() {
    _currentState.insertQuarter();
  }

  void ejectQuarter() {
    _currentState.ejectQuarter();
  }

  void turnCrank() {
    _currentState.turnCrank();
    _currentState.dispense();
  }

  void releaseBall() {
    print('Шарик выдан');
    if (_count != 0) {
      _count--;
    }
  }
}
