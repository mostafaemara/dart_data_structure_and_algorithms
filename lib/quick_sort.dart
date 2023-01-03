List<E> quicksortNaive<E extends Comparable<dynamic>>(List<E> list) {
  if (list.length < 2) return list;
  final pivot = list[0];
  final less = list.where((element) => element.compareTo(pivot) < 0);
  final equal = list.where((element) => element.compareTo(pivot) == 0);
  final greater = list.where((element) => element.compareTo(pivot) > 0);

  return [
    ...quicksortNaive(less.toList()),
    ...quicksortNaive(equal.toList()),
    ...quicksortNaive(greater.toList())
  ];
}
