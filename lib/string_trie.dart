import 'package:data_structure_and_algorithms/trie_node.dart';

class StringTrie {
  TrieNode<int> root = TrieNode(key: null, parent: null);

  void insert(String text) {
    var current = root;

    for (final codeUnit in text.codeUnits) {
      current.children[codeUnit] ??=
          TrieNode<int>(key: codeUnit, parent: current);

      current = current.children[codeUnit]!;
    }
    current.isTerminating = true;
  }

  bool contains(String text) {
    var current = root;
    for (final codeUnit in text.codeUnits) {
      final child = current.children[codeUnit];
      if (child == null) {
        return false;
      }
      current = child;
    }

    return current.isTerminating;
  }

  void remove(String text) {
    var current = root;

    for (final codeUnit in text.codeUnits) {
      final child = current.children[codeUnit];
      if (child == null) {
        return;
      }
      current = child;
    }
    if (!current.isTerminating) {
      return;
    }

    current.isTerminating = false;

    while (current.parent != null &&
        current.children.isEmpty &&
        !current.isTerminating) {
      current.parent!.children[current.key!] = null;
      current = current.parent!;
    }
  }
}
