import 'package:data_structure_and_algorithms/binary_node.dart';
import 'package:data_structure_and_algorithms/binary_search_tree.dart';
import 'package:data_structure_and_algorithms/queue.dart';
import 'package:data_structure_and_algorithms/tree.dart';

void main(List<String> arguments) {
  final root = BinarySearchTree();

  for (var i = 0; i < 5; i++) {
    root.insert(i);
  }

  print(root);
}

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
