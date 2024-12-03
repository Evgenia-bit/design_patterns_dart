/// Состояние автомата.
abstract interface class IState {
  /// Бросить монетку.
  void insertQuarter();

  /// Вернуть монетку.
  void ejectQuarter();

  /// Повернуть ручку.
  void turnCrank();

  /// Выдать шарик.
  void dispense();
}
