import 'package:data_structure_and_algorithms/trie_node.dart';

class Trie<E, T extends Iterable<E>> {
  TrieNode<E> root = TrieNode(key: null, parent: null);

  void insert(T collection) {
    var current = root;

    for (E element in collection) {
      current.children[element] ??= TrieNode<E>(key: element, parent: current);

      current = current.children[element]!;
    }
    current.isTerminating = true;
  }

  bool contains(T collection) {
    var current = root;

    for (final element in collection) {
      final child = current.children[element];
      if (child == null) {
        return false;
      }
      current = child;
    }

    return current.isTerminating;
  }

  void remove(T collection) {
    var current = root;
    for (final element in collection) {
      final child = current.children[element];
      if (child == null) {
        return;
      }
      current = child;
    }

    if (!current.isTerminating) {
      return;
    }

    while (current.parent != null &&
        current.children.isEmpty &&
        !current.isTerminating) {
      current.parent!.children[current.key!] = null;
      current = current.parent!;
    }
  }
}
