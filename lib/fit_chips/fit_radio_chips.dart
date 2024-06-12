import 'package:flutter/material.dart';
import 'package:flutter_fit_utils_ui/flutter_fit_utils_ui.dart';

/// Radio buttons represented by a list of [FitChip].
class FitRadioChips extends StatefulWidget {
  static const int _defaultPreSelectedIndex = 0;

  /// Title of the radio chips.
  final String title;

  /// Display text for each chip.
  final List<String> options;

  /// Index of the pre selected chip.
  final int selectedIndex;

  /// Execute when a new option is selected, and pass the newly selected option index.
  final Function(int)? onSelectionChanged;

  /// Creates a new [FitRadioChips].
  const FitRadioChips({
    super.key,
    required this.title,
    required this.options,
    this.selectedIndex = _defaultPreSelectedIndex,
    this.onSelectionChanged,
  });

  @override
  State<FitRadioChips> createState() => _FitRadioChipsState();
}

class _FitRadioChipsState extends State<FitRadioChips> {
  late int selectedIndex = widget.selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FitText.title(
          widget.title,
          padding: const EdgeInsets.only(bottom: 12),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 36,
          child: ListView(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            children: [
              for (int i = 0; i < widget.options.length; i++)
                Container(
                  margin: const EdgeInsets.only(right: 12),
                  child: FitChip(
                    onTap: () {
                      setState(() {
                        selectedIndex = i;

                        if (widget.onSelectionChanged != null) {
                          widget.onSelectionChanged!(i);
                        }
                      });
                    },
                    text: widget.options[i],
                    selected: i == selectedIndex,
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
