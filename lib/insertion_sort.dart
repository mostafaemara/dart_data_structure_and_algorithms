import 'package:data_structure_and_algorithms/swap.dart';

void insertionSort<E extends Comparable<dynamic>>(List<E> list) {
  for (int start = 1; start < list.length; start++) {
    for (int shifting = start; shifting > 0; shifting--) {
      if (list[shifting].compareTo(list[shifting - 1]) < 0) {
        list.swap(shifting, shifting - 1);
      } else {
        break;
      }
    }
  }
}
