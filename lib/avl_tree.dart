import 'package:data_structure_and_algorithms/avl_node.dart';
import "dart:math";

class AVLTree<E extends Comparable<dynamic>> {
  AVLNode<E>? root;

  void insert(E value) {
    root = _insert(root, value);
  }

  AVLNode<E> _insert(AVLNode<E>? node, E value) {
    if (node == null) {
      return AVLNode<E>(value);
    }

    if (value.compareTo(node.value) < 0) {
      node.leftChild = _insert(node.leftChild, value);
    } else {
      node.rightChild = _insert(node.rightChild, value);
    }
    final balancedNode = balanced(node);
    balancedNode.height =
        1 + max(balancedNode.leftHeight, balancedNode.riightHieght);
    return balancedNode;
  }

  AVLNode<E> leftRotate(AVLNode<E> node) {
    final pivot = node.rightChild!;
    node.rightChild = pivot.leftChild;
    pivot.leftChild = node;
    node.height = 1 + max(node.leftHeight, node.riightHieght);
    pivot.height = 1 + max(pivot.leftHeight, pivot.riightHieght);
    return pivot;
  }

  AVLNode<E> rightRotate(AVLNode<E> node) {
    final pivot = node.leftChild!;

    node.leftChild = pivot.rightChild;
    pivot.rightChild = node;
    node.height = 1 + max(node.leftHeight, node.riightHieght);
    pivot.height = 1 + max(pivot.leftHeight, pivot.riightHieght);
    return pivot;
  }

  AVLNode<E> rightLeftRotate(AVLNode<E> node) {
    if (node.rightChild == null) return node;
    node.rightChild = rightRotate(node.rightChild!);
    return leftRotate(node);
  }

  AVLNode<E> leftRightRotate(AVLNode<E> node) {
    if (node.leftChild == null) return node;
    node.leftChild = leftRotate(node.leftChild!);
    return rightRotate(node);
  }

  AVLNode<E> balanced(AVLNode<E> node) {
    switch (node.balanceFactor) {
      case 2:
        final left = node.leftChild;
        if (left != null && left.balanceFactor == -1) {
          return leftRightRotate(node);
        } else {
          return rightRotate(node);
        }
      case -2:
        final right = node.rightChild;
        if (right != null && right.balanceFactor == 1) {
          return rightLeftRotate(node);
        } else {
          return leftRotate(node);
        }

      default:
        return node;
    }
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

  AVLNode<E>? _remove(AVLNode<E>? node, E value) {
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
    final balancedNode = balanced(node);
    balancedNode.height =
        1 + max(balancedNode.leftHeight, balancedNode.riightHieght);
    return balancedNode;
  }

  @override
  String toString() => root.toString();
}

extension _MinFinder<E> on AVLNode<E> {
  AVLNode<E> get min => leftChild?.min ?? this;
}
