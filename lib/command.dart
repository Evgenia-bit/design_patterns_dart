/// Инициатор (пульт) (вместо класса Command можно использовать колбеки).
class RemoteControl {
  late List<Command> _onCommands;

  late List<Command> _offCommands;

  RemoteControl() {
    _onCommands = List<Command>.filled(7, NoCommand());
    _offCommands = List<Command>.filled(7, NoCommand());
  }

  void setCommand(int slot, Command onCommand, Command offCommand) {
    _onCommands[slot] = onCommand;
    _offCommands[slot] = offCommand;
  }

  void pressOnButton(int slot) {
    _onCommands[slot].execute();
  }

  void pressOffButton(int slot) {
    _offCommands[slot].execute();
  }
}

/// Исполнитель.
class Light {
  void on() {
    print('Light is on');
  }

  void off() {
    print('Light is off');
  }
}

/// Интерфейс команды.
abstract interface class Command {
  void execute();

  void undo();
}

/// Конкретная команда для включения света.
class LightOnCommand implements Command {
  Light light;

  LightOnCommand(this.light);

  @override
  void execute() {
    light.on();
  }

  @override
  void undo() {
    light.off();
  }
}

/// Конкретная команда для выключения света.
class LightOffCommand implements Command {
  Light light;

  LightOffCommand(this.light);

  @override
  void execute() {
    light.off();
  }

  @override
  void undo() {
    light.on();
  }
}

/// Мультикоманда.
class MacroCommand implements Command {
  List<Command> commands;

  MacroCommand(this.commands);

  @override
  void execute() {
    for (Command command in commands) {
      command.execute();
    }
  }

  @override
  void undo() {
    for (Command command in commands) {
      command.undo();
    }
  }
}

/// Команда по умолчанию.
class NoCommand implements Command {
  @override
  void execute() {
    print('No command');
  }

  @override
  void undo() {
    print('No command');
  }
}
