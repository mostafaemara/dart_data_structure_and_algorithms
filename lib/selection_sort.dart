import 'package:data_structure_and_algorithms/swap.dart';

void selectionSort<E extends Comparable<dynamic>>(List<E> list) {
  for (int start = 0; start < list.length - 1; start++) {
    var smallestIndex = start;
    for (int i = start + 1; i < list.length; i++) {
      if (list[i].compareTo(list[smallestIndex]) < 0) {
        smallestIndex = i;
      }
    }
    if (smallestIndex != start) {
      list.swap(smallestIndex, start);
    }
  }
}
