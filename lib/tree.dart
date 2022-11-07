import 'package:data_structure_and_algorithms/queue.dart';

class TreeNode<T> {
  T value;
  TreeNode(this.value);
  List<TreeNode<T>> childern = [];

  void add(TreeNode<T> child) {
    childern.add(child);
  }

  void forEachDepthFirst(void Function(TreeNode<T> node) performAction) {
    performAction(this);
    for (final child in childern) {
      child.forEachDepthFirst(performAction);
    }
  }

  void forEachLevelOrder(void Function(TreeNode<T> node) performAction) {
    final queue = QueueStack<TreeNode<T>>();
    performAction(this);
    childern.forEach(queue.enqueue);

    var node = queue.dequeue();
    while (node != null) {
      performAction(node);

      node.childern.forEach(queue.enqueue);

      node = queue.dequeue();
    }
  }

  TreeNode<T>? search(T value) {
    TreeNode<T>? result;
    forEachLevelOrder((node) {
      if (node.value == value) {
        result = node;
      }
    });
    return result;
  }

  @override
  String toString() {
    return "$value ";
  }
}

abstract class Widget {}

class Column extends Widget {
  Column({required this.childern});
  final List<Widget> childern;
}

class Padding extends Widget {
  final Widget child;

  Padding({required this.child});
}

class Text extends Widget {}
