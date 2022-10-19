import 'package:data_structure_and_algorithms/doubly_linked_list.dart';

enum Direction { front, back }

abstract class Deque<E> {
  bool get isEmpty;
  E? peek(Direction from);
  bool enqueue(E element, Direction to);
  E? dequeue(Direction from);
}

class DoubleLinkedListDeque<E> implements Deque<E> {
  final _list = DoublyLinkedList<E>();
  @override
  bool get isEmpty => _list.isEmpty;
  @override
  E? peek(Direction from) {
    if (_list.isEmpty) return null;
    if (from == Direction.front) {
      _list.head?.value;
    } else {
      _list.tail?.value;
    }
    return null;
  }

  @override
  bool enqueue(E element, Direction to) {
    if (to == Direction.front) {
      _list.push(element);
    } else {
      _list.append(element);
    }
    return true;
  }

  @override
  E? dequeue(Direction from) {
    if (from == Direction.front) {
      return _list.pop();
    } else {
      return _list.removeLast();
    }
  }
}
                                                                                                                                                                        