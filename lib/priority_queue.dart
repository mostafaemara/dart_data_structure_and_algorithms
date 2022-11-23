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
