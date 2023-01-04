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

extension Swappable<E> on List<E> {
  void swap(int indexA, int indexB) {
    if (indexA == indexB) return;
    final temp = this[indexA];
    this[indexA] = this[indexB];
    this[indexB] = temp;
  }
}

int _partitionLomuto<E extends Comparable<dynamic>>(
    List<E> list, int low, int hight) {
  final pivot = list[hight];
  var pivotIndex = low;
  for (int i = low; i < hight; i++) {
    if (list[i].compareTo(pivot) <= 0) {
      list.swap(i, pivotIndex);
      pivotIndex += 1;
    }
  }
  list.swap(pivotIndex, hight);
  return pivotIndex;
}

void quickSortLomuto<E extends Comparable<dynamic>>(
    List<E> list, int low, int hight) {
  if (low >= hight) return;
  final pivotIndex = _partitionLomuto(list, low, hight);
  quickSortLomuto(list, low, pivotIndex - 1);
  quickSortLomuto(list, pivotIndex + 1, hight);
}
