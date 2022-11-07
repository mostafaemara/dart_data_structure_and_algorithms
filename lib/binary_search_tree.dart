import 'package:data_structure_and_algorithms/binary_node.dart';

class BinarySearchTree<E extends Comparable<dynamic>> {
  BinaryNode<E>? root;

  void insert(E value) {
    root = _insert(root, value);
  }

  BinaryNode<E> _insert(BinaryNode<E>? node, E value) {
    if (node == null) {
      return BinaryNode<E>(value);
    }

    if (value.compareTo(node.value) < 0) {
      node.leftChild = _insert(node.leftChild, value);
    } else {
      node.rightChild = _insert(node.rightChild, value);
    }
    return node;
  }

  bool contains(E value) {
    var current = root;

    while (current != null) {
      if (current.value == value) return true;

      if (current.value.compareTo(value) < 0) {
        current = current.leftChild;
      } else {
        current = current.rightChild;
      }
    }
    return false;
  }

  void remove(E value) {
    root = _remove(root, value);
  }

  BinaryNode<E>? _remove(BinaryNode<E>? node, E value) {
    if (node == null) return null;
    if (node.value == value) {
      if (node.leftChild == null && node.rightChild == null) return null;

      if (node.leftChild == null) {
        return node.rightChild;
      } else if (node.rightChild == null) {
        return node.leftChild;
      }

      node.value = node.rightChild!.min.value;
      node.rightChild = _remove(node.rightChild, node.value);
    } else if (value.compareTo(node.value) < 0) {
      node.leftChild = _remove(node.leftChild, value);
    } else {
      node.rightChild = _remove(node.rightChild, value);
    }
    return node;
  }

  @override
  String toString() => root.toString();
}

extension _MinFinder<E> on BinaryNode<E> {
  BinaryNode<E> get min => leftChild?.min ?? this;
}
