import 'package:data_structure_and_algorithms/tree.dart';

void main(List<String> arguments) {
  final tree = makeTree();

  final result = tree.forEachLevelOrder(
    (node) {
      if (node.childern.isNotEmpty) {
        print(node.childern.toString());
      }
    },
  );
}

TreeNode<String> makeTree() {
  final tree = TreeNode("Beveragers");
  final hot = TreeNode("Hot");
  final cold = TreeNode("Cold");
  final tea = TreeNode("Tea");
  final coffee = TreeNode("Coffe");
  final chocolate = TreeNode("Chocolate");
  final blackTea = TreeNode("BlackTea");
  final greenTea = TreeNode("GreenTea");
  final chaiTea = TreeNode("CHaiTea");
  final soda = TreeNode("Soda");
  final milk = TreeNode("Milk");
  final gingerAle = TreeNode("ginger Ale");
  final bitterLemon = TreeNode("Bitter Lemon");

  tree.add(hot);
  tree.add(cold);
  hot.add(tea);
  hot.add(coffee);
  hot.add(chocolate);
  cold.add(soda);
  cold.add(milk);
  tea.add(blackTea);
  tea.add(greenTea);
  tea.add(chaiTea);
  soda.add(gingerAle);
  soda.add(bitterLemon);

  return tree;
}
