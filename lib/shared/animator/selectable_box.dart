import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class SelectableBox extends StatelessWidget {
  final Duration boxAnimation;
  final Duration boxBorderAnimation;

  final double height;
  final double width;

  final bool selected;
  final bool? selectedStateBoxBorder;

  final Color? colorSelected;
  final Color? colorUnselected;

  final Widget? child;
  final String? text;

  final void Function()? onTap;

  const SelectableBox({
    super.key,
    this.boxAnimation = const Duration(milliseconds: 300),
    this.boxBorderAnimation = const Duration(milliseconds: 50),
    this.height = 50,
    this.width = 100,
    required this.selected,
    this.selectedStateBoxBorder,
    this.colorSelected,
    this.colorUnselected,
    this.child,
    this.text,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onTap,
      child: Stack(
        children: [
          AnimatedContainer(
            duration: this.boxAnimation,
            alignment: Alignment.center,
            height: this.height,
            width: this.width,
            decoration: BoxDecoration(
              color: this.selected
                  ? this.colorSelected ??
                      Theme.of(context).buttonTheme.colorScheme!.secondary
                  : this.colorUnselected ?? Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: this.child ??
                Padding(
                  padding: const EdgeInsets.fromLTRB(6.0, 0.0, 6.0, 0.0),
                  child: AutoSizeText(
                    this.text ?? '',
                    wrapWords: false,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                  ),
                ),
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 50),
            height: this.height,
            width: this.width,
            decoration: BoxDecoration(
              border: Border.all(
                color: (this.selectedStateBoxBorder ?? this.selected)
                    ? this.colorSelected ??
                        Theme.of(context).buttonTheme.colorScheme!.secondary
                    : this.colorUnselected ?? Theme.of(context).cardColor,
              ),
              borderRadius: BorderRadius.circular(12.0),
            ),
          ),
        ],
      ),
    );
  }
}
