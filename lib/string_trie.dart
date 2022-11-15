import 'package:data_structure_and_algorithms/trie_node.dart';

class StringTrie {
  final Set<String> _allStrings = {};
  TrieNode<int> root = TrieNode(key: null, parent: null);

  void insert(String text) {
    var current = root;

    for (final codeUnit in text.codeUnits) {
      current.children[codeUnit] ??=
          TrieNode<int>(key: codeUnit, parent: current);

      current = current.children[codeUnit]!;
    }
    current.isTerminating = true;
    _allStrings.add(text);
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
    _allStrings.remove(text);

    while (current.parent != null &&
        current.children.isEmpty &&
        !current.isTerminating) {
      current.parent!.children[current.key!] = null;
      current = current.parent!;
    }
  }

  List<String> matchPrefix(String prefix) {
    var current = root;

    for (final codeUnit in prefix.codeUnits) {
      final child = current.children[codeUnit];
      if (child == null) {
        return [];
      }
      current = child;
    }
    return _moreMatches(prefix, current);
  }

  List<String> _moreMatches(String prefix, TrieNode<int> node) {
    List<String> results = [];
    if (node.isTerminating) {
      results.add(prefix);
    }

    for (final child in node.children.values) {
      final codeUnit = child!.key;

      results.addAll(
          _moreMatches("$prefix${String.fromCharCode(codeUnit!)}", child));
    }

    return results;
  }

  Set<String> get allStrings => _allStrings;

  int get count => _allStrings.length;

  bool get isEmpty => _allStrings.isEmpty;

  // List<String> allStrings() {
  //   return _allStrings("", root);
  // }

  // List<String> _allStrings(String prefix, TrieNode<int> node) {
  //   List<String> results = [];
  //   final currentPrefix =
  //       node.key != null ? "$prefix${String.fromCharCode(node.key!)}" : prefix;
  //   if (node.isTerminating) {
  //     results.add(currentPrefix);
  //   }
  //   for (final child in node.children.values) {
  //     results.addAll(_allStrings(currentPrefix, child!));
  //   }

  //   return results;
  // }
}
