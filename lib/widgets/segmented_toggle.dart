import 'package:flutter/material.dart';
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

  double get leftOffset {
    return initialPadding + (index * (28 + 14 + 15));
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var colorScheme = theme.colorScheme;
    return IntrinsicHeight(
      child: IntrinsicWidth(
        child: Stack(
          children: [
            Ink(
              decoration: BoxDecoration(
                color: colorScheme.surface,
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            AnimatedPositioned(
              duration: duration,
              curve: curve,
              left: leftOffset,
              bottom: initialPadding,
              child: Ink(
                height: 43,
                width: 43,
                decoration: BoxDecoration(
                  color: colorScheme.background,
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(3),
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
                            padding: const EdgeInsets.all(7),
                            child: entry.value,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 15),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
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
