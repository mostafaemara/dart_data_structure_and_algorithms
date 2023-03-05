import 'package:data_structure_and_algorithms/breadth_first_search.dart';
import 'package:data_structure_and_algorithms/graph.dart';

void main(List<String> arguments) {
  final graph = AdjacencyList<String>();
  final megan = graph.createVertex('Megan');
  final sandra = graph.createVertex('sandra');
  final pablo = graph.createVertex('pablo');
  final edith = graph.createVertex('edith');
  final ray = graph.createVertex('ray');
  final luke = graph.createVertex('luke');
  final manda = graph.createVertex('manda');
  final vicki = graph.createVertex('vicki');

  graph.addEdge(megan, sandra, weight: 0);
  graph.addEdge(megan, pablo, weight: 0);
  graph.addEdge(megan, edith, weight: 0);

  graph.addEdge(pablo, ray, weight: 0);
  graph.addEdge(pablo, luke, weight: 0);

  graph.addEdge(edith, manda, weight: 0);
  graph.addEdge(edith, vicki, weight: 0);

  graph.addEdge(manda, pablo, weight: 0);
  graph.addEdge(manda, megan, weight: 0);
  final vertices = graph.breadthFirstSearch(megan);
  vertices.forEach(print);
}
