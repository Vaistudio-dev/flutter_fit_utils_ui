import 'package:flutter/widgets.dart';
import 'package:flutter_fit_utils_ui/fit_sort/sort_algorithm.dart';
import 'package:flutter_fit_utils_ui/fit_sort/sortable.dart';

import '../flutter_fit_utils_ui.dart';

/// Widget that can sort a list of data in multiple ways, depending on the
/// sorting algorithm that you provides.
class FitSort extends StatefulWidget {
  static const String _defaultPromptText = "Filter By";

  /// List of the data to sort.
  final List<Sortable> data;

  /// List of the available sorting algorithms.
  final List<SortAlgorithm> availableAlgorithms;
  
  /// Execute when the selected sort algorithm changes.
  /// Pass the newly sorted data and the index of the newly selected algorithm.
  final void Function(List<Sortable>, int) onSortChanged;

  /// Index of the selected sorting algorithm.
  /// Takes the first algorithm by default.
  final int selectedSortIndex;

  /// Prompt text for the widget.
  final String prompt;

  /// Creates a new [FitSort].
  const FitSort({
    super.key,
    required this.data,
    required this.availableAlgorithms,
    required this.onSortChanged,
    this.selectedSortIndex = 0,
    this.prompt = _defaultPromptText,
  });

  @override
  State<FitSort> createState() => _FitSortState();
}

class _FitSortState extends State<FitSort> {
  late int selectedIndex = widget.selectedSortIndex;

  @override
  void initState() {
    super.initState();

    assert(widget.availableAlgorithms.isNotEmpty, "No algorithms provided.");
  }

  @override
  Widget build(BuildContext context) {
    return FitRadioChips(
      title: widget.prompt,
      onSelectionChanged: (value) => setState(() {
        selectedIndex = (selectedIndex + 1 >= widget.availableAlgorithms.length ? 0 : selectedIndex + 1);
        widget.onSortChanged(widget.availableAlgorithms[selectedIndex].sort(widget.data), selectedIndex);
      }),
      options: [widget.availableAlgorithms[selectedIndex].sortId.toString()],
    );
  }
}