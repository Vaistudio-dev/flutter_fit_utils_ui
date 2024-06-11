/// Interface that describes an object that can be sorted with a [SortAlgorithm].
abstract class Sortable {
  /// Returns the data to compare other instances to.
  Object getComparator();
}