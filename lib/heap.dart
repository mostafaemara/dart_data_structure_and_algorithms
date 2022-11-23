enum Priority { max, min }

class Heap<E extends Comparable<dynamic>> {
  Heap({this.priority = Priority.max, List<E>? elements}) {
    this.elements = (elements == null) ? [] : elements;
    _buildHeap();
  }

  void merge(List<E> list) {
    elements.addAll(list);
    _buildHeap();
  }

  void _buildHeap() {
    if (isEmpty) return;
    final start = elements.length ~/ 2 - 1;

    for (int i = start; i >= 0; i--) {
      _siftDown(i);
    }
  }

  late final List<E> elements;
  final Priority priority;

  bool get isEmpty => elements.isEmpty;
  int get size => elements.length;
  E? get peek => (isEmpty) ? null : elements.first;

  int _leftChildIndex(int parentIndex) {
    return 2 * parentIndex + 1;
  }

  int _rightChildIndex(int parentIndex) {
    return 2 * parentIndex + 2;
  }

  int _parentIndex(int childIndex) {
    return (childIndex - 1) ~/ 2;
  }

  bool _firstHashHigherPriority(E valueA, E valueB) {
    if (priority == Priority.max) {
      return (valueA.compareTo(valueB) > 0);
    } else {
      return (valueA.compareTo(valueB) < 0);
    }
  }

  int _higherPriority(int indexA, int indexB) {
    if (indexA >= elements.length) return indexB;
    final valueA = elements[indexA];
    final valueB = elements[indexB];
    final isFirst = _firstHashHigherPriority(valueA, valueB);

    return (isFirst) ? indexA : indexB;
  }

  void _swapValues(int indexA, int indexB) {
    final temp = elements[indexA];
    elements[indexA] = elements[indexB];
    elements[indexB] = temp;
  }

  void insert(E value) {
    elements.add(value);

    _siftUp(elements.length - 1);
  }

  void _siftUp(int index) {
    var child = index;
    var parent = _parentIndex(child);

    while (child > 0 && child == _higherPriority(child, parent)) {
      _swapValues(child, parent);
      child = parent;
      parent = _parentIndex(child);
    }
  }

  E? remove() {
    if (isEmpty) return null;
    _swapValues(0, elements.length - 1);
    final value = elements.removeLast();
    _siftDown(0);
    return value;
  }

  E? removeAt(int index) {
    final lastIndex = elements.length - 1;
    if (index < 0 || index > lastIndex) return null;
    if (index == lastIndex) return elements.removeLast();

    _swapValues(index, lastIndex);

    final value = elements.removeLast();
    _siftDown(index);
    _siftUp(index);
    return value;
  }

  void _siftDown(int index) {
    var parent = index;
    while (true) {
      final left = _leftChildIndex(parent);
      final right = _rightChildIndex(parent);
      var chosen = _higherPriority(left, parent);
      chosen = _higherPriority(right, chosen);
      if (chosen == parent) return;
      _swapValues(parent, chosen);
      parent = chosen;
    }
  }

  int indexOf(E value, {int index = 0}) {
    if (index >= elements.length) return -1;
    if (_firstHashHigherPriority(value, elements[index])) return -1;

    if (value == elements[index]) return index;
    final left = indexOf(value, index: _leftChildIndex(index));
    if (left != -1) return left;
    return indexOf(value, index: _rightChildIndex(index));
  }

  @override
  String toString() {
    // TODO: implement toString
    return elements.toString();
  }
}
