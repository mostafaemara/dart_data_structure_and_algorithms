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

void quickSortHoare<E extends Comparable<dynamic>>(
    List<E> list, int low, int hight) {
  if (low >= hight) return;
  final highLeft = _partitionHoare(list, low, hight);
  quickSortHoare(list, low, highLeft);
  quickSortHoare(list, highLeft + 1, hight);
}

int _partitionHoare<E extends Comparable<dynamic>>(
    List<E> list, int low, int hight) {
  final pivot = list[low];
  var left = low - 1;
  var right = hight + 1;

  while (true) {
    do {
      left += 1;
    } while (list[left].compareTo(pivot) < 0);

    do {
      right -= 1;
    } while (list[right].compareTo(pivot) > 0);
    if (left < right) {
      list.swap(left, right);
    } else {
      return right;
    }
  }
}

void quickSortMedian<E extends Comparable<dynamic>>(
    List<E> list, int low, int high) {
  if (low > high) return;
  var pivotIndex = _medianOfThree(list, low, high);
  list.swap(pivotIndex, high);
  pivotIndex = _partitionLomuto(list, low, high);
  quickSortLomuto(list, low, pivotIndex - 1);
  quickSortLomuto(list, pivotIndex + 1, high);
}

int _medianOfThree<T extends Comparable<dynamic>>(
    List<T> list, int low, int high) {
  final center = (low + high) ~/ 2;
  if (list[low].compareTo(list[center]) > 0) {
    list.swap(low, center);
  }
  if (list[low].compareTo(list[high]) > 0) {
    list.swap(low, high);
  }
  if (list[center].compareTo(list[high]) > 0) {
    list.swap(center, high);
  }
  return center;
}
