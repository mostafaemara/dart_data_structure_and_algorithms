import 'package:data_structure_and_algorithms/swap.dart';

void bubbleSort<E extends Comparable<dynamic>>(List<E> list) {
  for (int end = list.length - 1; end >= 0; end--) {
    var swapped = false;
    for (int i = 0; i < end; i++) {
      if (list[i].compareTo(list[i + 1]) > 0) {
        list.swap(i, i + 1);
        swapped = true;
      }
    }
    if (!swapped) return;
  }
}
