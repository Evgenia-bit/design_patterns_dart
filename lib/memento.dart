/// Originator - Создатель может производить снимки своего состояния, а также воспроизводить прошлое состояние, если подать в него готовый снимок.
class Editor {
  String text;
  Editor(this.text);

  Memento save() {
    return EditorMemento(text);
  }

  void restore(Memento memento) {
    text = memento.getState();
  }
}

/// Memento - Снимок — это простой объект данных, содержащий состояние создателя. Надёжнее всего сделать объекты снимков неизменяемыми, передавая в них состояние только через конструктор.
abstract interface class Memento {
  String getState();
}

class EditorMemento implements Memento {
  final String state;

  EditorMemento(this.state);

  @override
  String getState() {
    return state;
  }
}

/// Caretaker - Опекун должен знать, когда делать снимок создателя и когда его нужно восстанавливать.
/// Опекун может хранить историю прошлых состояний создателя в виде стека из снимков.
/// Когда понадобится отменить выполненную операцию, он возьмёт «верхний» снимок из стека и
/// передаст его создателю для восстановления.
class UndoRedoManager {
  final List<Memento> _undoList = [];
  final List<Memento> _redoList = [];
  final Editor editor;
  UndoRedoManager(this.editor);

  void backup() {
    _undoList.add(editor.save());
    _redoList.clear();
  }

  void undo() {
    if (_undoList.length < 2) return;
    final memento = _undoList.removeLast();
    _redoList.add(memento);
    editor.restore(_undoList.last);
  }

  void redo() {
    if (_redoList.isEmpty) return;
    final memento = _redoList.removeLast();
    _undoList.add(memento);
    editor.restore(memento);
  }
}
