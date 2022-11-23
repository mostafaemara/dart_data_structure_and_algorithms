extension SortedListt<E extends Comparable<dynamic>> on List<E> {
  int? binarySearch(E value, [int? start, int? end]) {
    final startIndex = start ?? 0;
    final endIndex = end ?? length;
    if (startIndex >= endIndex) {
      return null;
    }
    final size = endIndex - startIndex;
    final middel = startIndex + size ~/ 2;
    if (value == this[middel]) {
      return middel;
    }
    if (value.compareTo(this[middel]) < 0) {
      return binarySearch(value, startIndex, middel);
    } else {
      return binarySearch(value, middel + 1, endIndex);
    }
  }
}
