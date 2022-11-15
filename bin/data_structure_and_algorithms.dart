import 'package:data_structure_and_algorithms/string_trie.dart';

void main(List<String> arguments) {
  final trie = StringTrie();
  trie.insert("car");
  trie.insert("card");
  trie.insert("care");
  trie.insert("cared");
  trie.insert("carbs");
  trie.insert("caraspace");
  trie.insert("cargo");

  print(trie.allStrings);
}
