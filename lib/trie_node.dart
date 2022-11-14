class TrieNode<T> {
  TrieNode({this.key, this.parent});
  T? key;
  TrieNode<T>? parent;
  Map<T, TrieNode<T>?> children = {};

  bool isTerminating = false;
}
