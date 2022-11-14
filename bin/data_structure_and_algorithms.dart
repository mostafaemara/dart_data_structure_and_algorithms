import 'package:data_structure_and_algorithms/binary_node.dart';
import 'package:data_structure_and_algorithms/queue.dart';
import 'package:data_structure_and_algorithms/string_trie.dart';
import 'package:data_structure_and_algorithms/tree.dart';

void main(List<String> arguments) {
  final trie = StringTrie();
  trie.insert("Sasa");
  trie.insert("Sasaman");
  assert(trie.contains("Sasa"));
  print("sasa is in trie");
  assert(trie.contains("Sasaman"));
  print("sasaman is in trie");

  trie.remove("Sasa");

  assert(!trie.contains("Sasa"));

  assert(trie.contains("Sasaman"));
  print("sasaman is in trie");
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
