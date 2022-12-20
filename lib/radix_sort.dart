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
