import 'package:data_structure_and_algorithms/heap_sort.dart';

void main(List<String> arguments) {
  final list = [6, 12, 2, 26, 8, 18, 21, 9, 51];
  print(list);
  list.heapSortInPlace();
  print(list);
}
