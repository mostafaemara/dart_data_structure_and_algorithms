import 'dart:math';

extension RadixSort on List<int> {
  void radixSort() {
    const base = 10;
    bool done = false;

    var place = 1;

    while (!done) {
      done = true;
      final buckets = List.generate(base, (index) => <int>[]);

      forEach((number) {
        final remainingPart = number ~/ place;

        final digit = remainingPart % base;
        buckets[digit].add(number);

        if (remainingPart ~/ base > 0) {
          done = false;
        }
      });

      place *= base;
      clear();
      addAll(buckets.expand((element) => element));
    }
  }
}

extension Digits on int {
  static const _base = 10;
  int digits() {
    int count = 0;
    var number = this;

    while (number != 0) {
      count++;
      number ~/= _base;
    }
    return count;
  }

  int? digitsAt(int position) {
    if (position >= digits()) return null;
    var number = this;
    while (number ~/ pow(_base, position + 1) != 0) {
      number ~/= _base;
    }

    return number % _base;
  }
}

extension MsdRadixSort on List<int> {
  int maxDigits() {
    if (isEmpty) return 0;
    return reduce(max).digits();
  }

  void lexicographicalSort() {
    final sorted = _msdRadixSorted(this, 0);
    clear();
    addAll(sorted);
  }

  List<int> _msdRadixSorted(List<int> list, int position) {
    if (list.length < 2 || position >= list.maxDigits()) {
      return list;
    }
    final buckets = List.generate(
      10,
      (_) => <int>[],
    );
    var priorityBucket = <int>[];

    for (final number in list) {
      final digit = number.digitsAt(position);
      if (digit == null) {
        priorityBucket.add(number);
        continue;
      }
      buckets[digit].add(number);
    }
    final bucketOrder = buckets.reduce((result, bucket) {
      if (buckets.isEmpty) return result;
      final sortedList = _msdRadixSorted(bucket, position + 1);
      return result..addAll(sortedList);
    });

    return priorityBucket..addAll(bucketOrder);
  }
}
