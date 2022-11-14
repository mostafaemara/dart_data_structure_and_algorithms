class AVLNode<T> {
  AVLNode(this.value);
  T value;
  AVLNode<T>? leftChild;
  AVLNode<T>? rightChild;
  int height = 0;

  int get balanceFactor => leftHeight - riightHieght;
  int get leftHeight => leftChild?.height ?? -1;
  int get riightHieght => rightChild?.height ?? -1;
  @override
  toString() {
    return _diagram(this);
  }

  String _diagram(AVLNode<T>? node,
      [String top = "", String root = "", String bottom = ""]) {
    if (node == null) {
      return "$root null\n";
    }
    if (node.leftChild == null && node.rightChild == null) {
      return '$root ${node.value}\n';
    }
    final a = _diagram(node.rightChild, '$top ', "$top ----", "$top |");

    final b = "$root${node.value}\n";

    final c = _diagram(node.leftChild, '$bottom |', "$bottom ----", "$bottom ");

    return "$a$b$c";
  }

  void traverseInOrder(void Function(T value) action) {
    leftChild?.traverseInOrder(action);
    action(value);
    rightChild?.traverseInOrder(action);
  }

  void traversePreOrder(void Function(T value) action) {
    action(value);
    leftChild?.traversePreOrder(action);

    rightChild?.traversePreOrder(action);
  }

  AVLNode<T>? fromList(List<T> list) {
    if (list.isEmpty) return null;

    final value = list.reversed.toList().removeLast();
    if (value == null) return null;

    final node = AVLNode(value);
    node.leftChild = fromList(list);
    node.rightChild = fromList(list);
    return node;
  }

  List<T?> toList() {
    List<T?> list = [];
    _nullTraversePreOrder((value) {
      print(value);
      list.add(value);
    });
    return list;
  }

  void _nullTraversePreOrder(void Function(T? value) action) {
    action(value);
    if (leftChild != null) {
      leftChild?._nullTraversePreOrder(action);
    } else {
      action(null);
    }
    if (rightChild != null) {
      rightChild?._nullTraversePreOrder(action);
    } else {
      action(null);
    }
  }
}
