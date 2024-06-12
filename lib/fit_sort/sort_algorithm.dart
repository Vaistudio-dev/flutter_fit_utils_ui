import 'package:flutter_fit_utils_ui/fit_sort/sortable.dart';

/// Interface for a sorting algorithm to be used with a [FitSort].
abstract class SortAlgorithm {
  String sortId = "";

  /// Sorts a list of [Sortable] data.
  List<Sortable> sort(List<Sortable> data);
}

/// Sorts a list of data in alphabetical order.
final class AToZSort implements SortAlgorithm {
  @override
  String sortId = "A-Z";

  @override
  List<Sortable> sort(List<Sortable> data) {
    final copy = List<Sortable>.from(data);
    copy.sort((a, b) =>
        a.getComparator().toString().compareTo(b.getComparator().toString()));
    return copy;
  }
}

/// Sorts a list of data in reversed alphabetical order.
final class ZToASort implements SortAlgorithm {
  @override
  String sortId = "Z-A";

  @override
  List<Sortable> sort(List<Sortable> data) {
    final copy = List<Sortable>.from(data);
    copy.sort((a, b) =>
        b.getComparator().toString().compareTo(a.getComparator().toString()));
    return copy;
  }
}
