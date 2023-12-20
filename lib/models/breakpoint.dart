class Breakpoint {
  BreakpointType type;
  double maxWidth;

  Breakpoint({
    required this.type,
    required this.maxWidth,
  });

  @override
  String toString() {
    return 'Breakpoint(type: $type, maxWidth: $maxWidth)';
  }
}

enum BreakpointType {
  resize,
  scale,
}
