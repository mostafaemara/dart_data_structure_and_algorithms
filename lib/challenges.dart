import 'package:data_structure_and_algorithms/heap.dart';

import 'binary_node.dart';
import 'queue.dart';
import 'tree.dart';

int calculateHeightOfTree<T>(BinaryNode<T>? tree) {
  if (tree == null) {
    return 0;
  }

  if (tree.leftChild == null && tree.rightChild == null) {
    return 0;
  }

  int leftHeight = calculateHeightOfTree(tree.leftChild) + 1;
  int rightHeight = calculateHeightOfTree(tree.rightChild) + 1;

  if (leftHeight > rightHeight) {
    return leftHeight;
  } else {
    return rightHeight;
  }
}

void printEachLevel<T>(TreeNode<T> tree) {
  final result = StringBuffer();
  var queue = QueueStack<TreeNode<T>>();
  var nodesLeftInCurrentLevel = 0;
  queue.enqueue(tree);
  while (!queue.isEmpty) {
    nodesLeftInCurrentLevel = queue.length;

    while (nodesLeftInCurrentLevel > 0) {
      final node = queue.dequeue();
      if (node == null) break;
      result.write('${node.value} ');
      for (var element in node.childern) {
        queue.enqueue(element);
      }

      nodesLeftInCurrentLevel -= 1;
    }

    result.write('\n');
  }

  print(result);
}

bool isBinarySearchTree<T extends Comparable>(BinaryNode<T>? node) {
  if (node == null) return true;

  bool isLeftChildBinarySearchTree = isBinarySearchTree(node.leftChild);
  bool isRightChildBinarySearchTree = isBinarySearchTree(node.rightChild);
  bool isCurrentNodeBinarySearchTree = (node.leftChild == null ||
          node.leftChild!.value.compareTo(node.value) < 0) &&
      (node.rightChild == null ||
          node.rightChild!.value.compareTo(node.value) >= 0);

  if (isLeftChildBinarySearchTree &&
      isRightChildBinarySearchTree &&
      isCurrentNodeBinarySearchTree) {
    return true;
  } else {
    return false;
  }
}

bool isEqual<T>(BinaryNode<T>? node1, BinaryNode<T>? node2) {
  if (node1 == null && node2 == null) return true;
  if (node1 == null || node2 == null) return false;

  return (node1.value == node2.value) &&
      isEqual(node1.leftChild, node2.leftChild) &&
      isEqual(node1.rightChild, node2.rightChild);
}

bool isSubTree<T>(BinaryNode<T> tree, BinaryNode<T> subTree) {
  Set values = {};
  subTree.traverseInOrder((value) {
    values.add(value);
  });

  bool isEqual = true;

  tree.traverseInOrder((value) {
    isEqual &= values.contains(value);
  });
  return isEqual;
}

int? binarySearch<E extends Comparable<dynamic>>(E value, List<E> list,
    [int? start, int? end]) {
  final startIndex = start ?? 0;
  final endIndex = end ?? list.length;
  if (startIndex >= endIndex) {
    return null;
  }
  final size = endIndex - startIndex;
  final middle = startIndex + size ~/ 2;

  if (value == list[middle]) {
    return middle;
  }

  if (value.compareTo(list[middle]) < 0) {
    return binarySearch(value, list, start, middle);
  } else {
    return binarySearch(value, list, middle + 1, end);
  }
}

int? binarySearchNonRecursive<E extends Comparable<dynamic>>(
  E value,
  List<E> list,
) {
  int start = 0;
  int end = list.length;

  while (start < end) {
    final size = end - start;
    final middle = start + size ~/ 2;
    if (value == list[middle]) {
      return middle;
    }
    if (value.compareTo(list[middle]) < 0) {
      end = middle;
    } else {
      start = middle + 1;
    }
  }
  return null;
}

List<int>? binarySearchRange<E extends Comparable<dynamic>>(
  E value,
  List<E> list,
) {
  int start = 0;
  int end = list.length;
  List<int> range = [];
  while (start < end) {
    final size = end - start;
    final middle = start + size ~/ 2;
    if (value == list[middle]) {
      if (range.isEmpty) {
        range.add(middle);
      } else {
        range[1] = middle;
      }
    }
    if (value.compareTo(list[middle]) < 0) {
      end = middle;
    } else {
      start = middle + 1;
    }
  }
  return range;
}

int? findNthSmallestInteger(int n, List<int> integers) {
  final heap = Heap(priority: Priority.min, elements: integers);

  int? value;
  for (int i = 0; i < n; i++) {
    value = heap.remove();
  }
  return value;
}

Heap combineTwoHaaps(Heap a, Heap b) {
  return Heap(elements: [...a.elements, ...b.elements], priority: a.priority);
}

bool isMinHeap<E extends Comparable>(List<E> list) {
  final start = list.length ~/ 2;
  for (int i = start; i >= 0; i--) {
    final leftChildIndex = 2 * i + 1;
    final rightChildIndex = 2 * i + 2;
    if (list[i].compareTo(list[leftChildIndex]) > 0 ||
        list[i].compareTo(list[rightChildIndex]) > 0) {
      return false;
    }
  }
  return true;
}