abstract interface class MyIterator<T> {
  /// Возвращает `true`, если итератор имеет следующий элемент.
  bool hasNext();

  /// Возвращает следующий элемент и сдвигает указатель.
  T next();
}
