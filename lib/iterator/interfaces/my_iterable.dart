import 'package:design_pattern_learning/iterator/interfaces/my_iterator.dart';

abstract interface class MyIterable<T> {
  /// Возвращает итератор для обхода всех элементов коллекции.
  MyIterator<T> get iterator;
}
