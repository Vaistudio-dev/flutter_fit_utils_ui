import 'package:flutter/material.dart';
import 'package:flutter_fit_utils_ui/flutter_fit_utils_ui.dart';

/// Radio buttons represented by a list of [FitSelectableCard].
class FitRadioCards extends StatefulWidget {
  static const int _defaultPreSelectedIndex = 0;

  /// Title of the selection.
  final Widget? title;

  /// List of the title and description for each option.
  final List<(String, String)> options;

  /// Index of the pre selected option.
  final int selectedIndex;

  /// Execute when a new option is selected, and pass the newly selected option index.
  final Function(int)? onSelectionChanged;

  /// Creates a new [FitRadioCards].
  const FitRadioCards({
    super.key,
    this.title,
    required this.options,
    this.selectedIndex = _defaultPreSelectedIndex,
    this.onSelectionChanged,
  });

  @override
  State<FitRadioCards> createState() => _FitRadioCardsState();
}

class _FitRadioCardsState extends State<FitRadioCards> {
  late int selectedIndex = widget.selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.title != null)
          widget.title!,
        const SizedBox(height: 12),
        for (int i = 0; i < widget.options.length; i++)
          FitSelectableCard(
            title: widget.options[i].$1,
            description: widget.options[i].$2,
            selected: selectedIndex == i,
            onTap: () {
              setState(() {
                selectedIndex = i;

                if (widget.onSelectionChanged != null) {
                  widget.onSelectionChanged!(i);
                }
              });
            },
          ),
      ],
    );
  }
}