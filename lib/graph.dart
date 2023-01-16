enum EdgeType { directed, undirected }

class Vertex<T> {
  Vertex({required this.index, required this.data});

  final int index;
  final T data;

  @override
  String toString() => data.toString();
}

class Edge<T> {
  Edge({required this.source, required this.destination, required this.weight});
  final Vertex<T> source;
  final Vertex<T> destination;
  final double? weight;
}

abstract class Graph<E> {
  Iterable<Vertex<E>> get vertices;
  Vertex<E> createVertex(E data);
  void addEdge(Vertex<E> source, Vertex<E> destination,
      {EdgeType edgeType, double? weight});

  List<Edge<E>> edges(Vertex<E> source);
  double? weight(
    Vertex<E> source,
    Vertex<E> destination,
  );
}
