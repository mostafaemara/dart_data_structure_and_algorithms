import 'package:data_structure_and_algorithms/doubly_linked_list.dart';
import 'package:data_structure_and_algorithms/ring_buffer.dart';

abstract class Queue<E> {
  bool enqueue(E element);
  E? dequeue();
  bool get isEmpty;
  E? get peek;
}

class QueueList<E> implements Queue {
  final _list = <E>[];
  @override
  dequeue() => (isEmpty) ? null : _list.removeAt(0);

  @override
  bool enqueue(element) {
    _list.add(element);
    return true;
  }

  @override
  bool get isEmpty => _list.isEmpty;

  @override
  get peek => (isEmpty) ? null : _list.first;

  @override
  String toString() => _list.toString();
}

class QueueLinkedList<E> implements Queue<E> {
  final _list = DoublyLinkedList<E>();
  @override
  dequeue() => _list.pop();

  @override
  bool enqueue(element) {
    _list.append(element);
    return true;
  }

  @override
  bool get isEmpty => _list.isEmpty;

  @override
  get peek => (isEmpty) ? null : _list.head?.value;

  @override
  String toString() => _list.toString();
}

class QueueRingBuffer<E> implements Queue<E> {
  final RingBuffer _ringBuffer;

  QueueRingBuffer(int length) : _ringBuffer = RingBuffer<E>(length);
  @override
  E? dequeue() => _ringBuffer.read();

  @override
  bool enqueue(E element) {
    if (_ringBuffer.isFull) {
      return false;
    }
    _ringBuffer.write(element);
    return true;
  }

  @override
  bool get isEmpty => _ringBuffer.isEmpty;

  @override
  E? get peek => _ringBuffer.peek;
  @override
  String toString() => _ringBuffer.toString();
}

class QueueStack<E> implements Queue<E> {
  final _leftStack = <E>[];
  final _rightStack = <E>[];
  @override
  E? dequeue() {
    if (_leftStack.isEmpty) {
      _leftStack.addAll(_rightStack.reversed);
      _rightStack.clear();
    }
    if (_leftStack.isEmpty) return null;

    return _leftStack.removeLast();
  }

  @override
  bool enqueue(E element) {
    _rightStack.add(element);
    return true;
  }

  @override
  bool get isEmpty => _leftStack.isEmpty && _rightStack.isEmpty;

  @override
  E? get peek => _leftStack.isNotEmpty ? _leftStack.last : _rightStack.first;

  @override
  String toString() {
    final combined = [..._leftStack, ..._rightStack].join(", ");

    return "[$combined]";
  }
}
