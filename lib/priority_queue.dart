import 'package:data_structure_and_algorithms/queue.dart';

import 'heap.dart';
export "heap.dart" show Priority;

class PriorityQueue<E extends Comparable<dynamic>> implements Queue<E> {
  PriorityQueue({List<E>? elements, Priority priority = Priority.max}) {
    _heap = Heap(elements: elements, priority: priority);
  }
  late Heap<E> _heap;
  @override
  E? dequeue() => _heap.remove();

  @override
  bool enqueue(E element) {
    _heap.insert(element);
    return true;
  }

  @override
  bool get isEmpty => _heap.isEmpty;

  @override
  E? get peek => _heap.peek;
}

class ListPriorityQueue<E extends Comparable<dynamic>> implements Queue<E> {
  ListPriorityQueue({List<E>? elements, Priority priority = Priority.max}) {
    _priority = priority;
    _list = elements ?? [];

    _list.sort(
      (a, b) => _comparePriority(a, b),
    );
  }
  late Priority _priority;

  int _comparePriority(E a, E b) {
    if (_priority == Priority.max) {
      return a.compareTo(b);
    } else {
      return b.compareTo(a);
    }
  }

  late List<E> _list;
  @override
  E? dequeue() => isEmpty ? null : _list.removeLast();

  @override
  bool enqueue(E element) {
    for (int i = 0; i < _list.length; i++) {
      if (_comparePriority(element, _list[i]) < 0) {
        _list.insert(i, element);
        return true;
      }
    }
    _list.add(element);

    return true;
  }

  @override
  bool get isEmpty => _list.isEmpty;

  @override
  E? get peek => _list.last;
}
