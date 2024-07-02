import 'package:flutter/material.dart';
import 'package:flutter_fit_utils_ui/flutter_fit_utils_ui.dart';

/// Pre-built dialog.
class FitDialog extends StatefulWidget {
  /// Title of the dialog.
  /// If null, the title will not be shown.
  final String? title;

  /// Child of the dialog.
  final Widget child;

  /// Height of the dialog.
  /// If null, the dialog will take half the height of the screen.
  final double? height;

  /// Text for the confirmation button.
  final String confirmLabel;

  /// Callback when the confirm button is pressed.
  /// If null, the confirm button will not be shown.
  final void Function()? onConfirm;

  /// Creates a new [FitDialog].
  const FitDialog(
      {super.key,
      this.title,
      this.onConfirm,
      required this.child,
      this.height,
      this.confirmLabel = "Ok"});

  @override
  State<FitDialog> createState() => _FitDialogState();

  void show(BuildContext context) {
    showBottomSheet(
      context: context,
      builder: (context) => this,
    );
  }
}

class _FitDialogState extends State<FitDialog> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height ?? MediaQuery.of(context).size.height * 0.5,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: FitTheme.of(context)?.baseRadius,
      ),
      child: Container(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        margin: const EdgeInsets.all(24),
        child: SingleChildScrollView(
          child: Column(
            children: [
              if (widget.title != null)
                FitText(
                  widget.title!,
                  textAlign: TextAlign.center,
                ),
              const SizedBox(height: 24),
              widget.child,
              const SizedBox(height: 24),
              if (widget.onConfirm != null)
                FitButton(
                  onTap: widget.onConfirm!,
                  child: FitText.button(widget.confirmLabel),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
