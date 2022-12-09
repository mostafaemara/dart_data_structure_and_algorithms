List<E> mergeSort<E extends Comparable<dynamic>>(List<E> list) {
  if (list.length < 2) return list;

  final middle = list.length ~/ 2;
  final left = mergeSort(list.sublist(0, middle));
  final right = mergeSort(list.sublist(middle));
  return _mergeIterable(left, right);
}

List<E> _merge<E extends Comparable<dynamic>>(List<E> listA, List<E> listB) {
  var indexA = 0;
  var indexB = 0;
  final result = <E>[];
  while (indexA < listA.length && indexB < listB.length) {
    final valueA = listA[indexA];
    final valueB = listB[indexB];
    if (valueA.compareTo(valueB) < 0) {
      result.add(valueA);
      indexA += 1;
    } else if (valueA.compareTo(valueB) > 0) {
      result.add(valueB);
      indexB += 1;
    } else {
      result.add(valueA);
      result.add(valueB);
      indexA += 1;
      indexB += 1;
    }
  }

  if (indexA < listA.length) {
    result.addAll(listA.getRange(indexA, listA.length));
  }

  if (indexB < listB.length) {
    result.addAll(listB.getRange(indexB, listB.length));
  }
  return result;
}

//challenge
List<E> _mergeIterable<E extends Comparable<dynamic>>(
    Iterable<E> collectionA, Iterable<E> collectionB) {
  var indexA = 0;
  var indexB = 0;
  final result = <E>[];
  while (indexA < collectionA.length && indexB < collectionB.length) {
    final valueA = collectionA.elementAt(indexA);
    final valueB = collectionB.elementAt(indexB);
    if (valueA.compareTo(valueB) < 0) {
      result.add(valueA);
      indexA += 1;
    } else if (valueA.compareTo(valueB) > 0) {
      result.add(valueB);
      indexB += 1;
    } else {
      result.add(valueA);
      result.add(valueB);
      indexA += 1;
      indexB += 1;
    }
  }

  if (indexA < collectionA.length) {
    for (int i = indexA; i < collectionA.length; i++) {
      result.add(collectionA.elementAt(i));
    }
  }

  if (indexB < collectionB.length) {
    for (int i = indexB; i < collectionB.length; i++) {
      result.add(collectionB.elementAt(i));
    }
  }
  return result;
}
