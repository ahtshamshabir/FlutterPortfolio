import 'package:flutter/material.dart';
import 'package:flutter_portfolio/utils/dynamic_scaler.dart';
import 'package:flutter_portfolio/utils/separate_widgets.dart';

class SegmentedToggle<T> extends StatelessWidget {
  T value;
  Map<T, Widget> children;
  void Function(T) onChanged;
  double initialPadding = 2.5;
  Duration duration = const Duration(milliseconds: 200);
  Curve curve = Curves.ease;

  SegmentedToggle({super.key, required this.value, required this.onChanged, required this.children});

  int get index => children.keys.toList().indexOf(value);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var colorScheme = theme.colorScheme;
    return LayoutBuilder(builder: (context, constraints) {
      var maxWidth = constraints.maxWidth;
      var maxHeight = constraints.maxWidth / 3.6;
      var containerPadding = 3.percentOf(maxWidth);
      var containerWidth = constraints.maxWidth - (containerPadding * 2);
      var div = containerWidth / 8;
      var containerHeight = div * 2;
      var iconDiv = div * 2;
      var iconPadding = 10.percentOf(iconDiv);
      var spacing = div;
      var leftOffset = containerPadding + (index * (iconDiv + spacing));
      return Stack(
        children: [
          Ink(
            width: maxWidth,
            height: maxHeight,
            decoration: BoxDecoration(
              color: colorScheme.surface,
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          AnimatedPositioned(
            duration: duration,
            curve: curve,
            left: leftOffset,
            height: iconDiv,
            width: iconDiv,
            bottom: (maxHeight / 2) - (iconDiv / 2),
            child: Container(
              alignment: Alignment.center,
              child: Ink(
                height: iconDiv,
                width: iconDiv,
                decoration: BoxDecoration(
                  color: colorScheme.background,
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ),
          Container(
            width: maxWidth,
            height: maxHeight,
            padding: EdgeInsets.all(containerPadding),
            child: Row(
              children: [
                ...separateWidgets(
                  children.entries.map(
                    (entry) => SegmentedToggleButton(
                      isActive: entry.key == value,
                      onPressed: () => onChanged(entry.key),
                      child: AnimatedScale(
                        duration: duration,
                        curve: curve,
                        scale: entry.key == value ? 1 : 0.8,
                        child: Container(
                          height: iconDiv,
                          width: iconDiv,
                          padding: EdgeInsets.all(iconPadding),
                          child: FittedBox(child: entry.value),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: spacing),
                )
              ],
            ),
          ),
        ],
      );
    });
  }
}

class SegmentedToggleButton extends StatelessWidget {
  bool isActive;
  void Function() onPressed;
  Widget child;

  SegmentedToggleButton({super.key, required this.onPressed, required this.child, this.isActive = false});

  @override
  Widget build(BuildContext context) {
    var appTheme = Theme.of(context);
    var borderRadius = BorderRadius.circular(30);
    return InkWell(
      onTap: onPressed,
      borderRadius: borderRadius,
      child: child,
    );
  }
}
