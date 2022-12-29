import 'package:data_structure_and_algorithms/radix_sort.dart';

void main(List<String> arguments) {
  final list = [88, 410, 1772, 20, 123456789876543210];

  list.radixSort();
  print(list);
}
