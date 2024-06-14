
import 'package:flutter/material.dart';

class ExpandableText extends StatefulWidget {
  final String text;
  final int maxLines;
  final TextStyle style;
  final TextStyle fadeTextStyle;

  const ExpandableText({
    super.key,
    required this.text,
    required this.style,
    required this.fadeTextStyle,
    this.maxLines = 4,
  });

  @override
  State<ExpandableText> createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  late final TextStyle effectiveStyle;
  bool _isExpanded = false;
  late bool _isOverflowing;

  @override
  void initState() {
    super.initState();
    effectiveStyle = widget.style;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Determine if the text will overflow and if the fade effect is needed
        final span = TextSpan(text: widget.text, style: effectiveStyle);
        final textPainter = TextPainter(
          text: span,
          maxLines: widget.maxLines,
          textDirection: TextDirection.ltr,
        )..layout(maxWidth: constraints.maxWidth);

        _isOverflowing = textPainter.didExceedMaxLines;

        return GestureDetector(
          onTap: () {
            setState(() {
              _isExpanded = !_isExpanded;
            });
          },
          child: AnimatedCrossFade(
            firstChild: _isOverflowing
                ? ShaderMask(
                    shaderCallback: (Rect bounds) {
                      return const LinearGradient(
                        colors: [Colors.black, Colors.transparent],
                        stops: [0.5, 1.0],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomLeft,
                      ).createShader(Rect.fromLTRB(0, 0, bounds.width, bounds.height));
                    },
                    blendMode: BlendMode.dstIn,
                    child: Text(
                      widget.text,
                      maxLines: widget.maxLines,
                      overflow: TextOverflow.ellipsis,
                      style: effectiveStyle,
                    ),
                  )
                : Text(
                    widget.text,
                    maxLines: widget.maxLines,
                    overflow: TextOverflow.ellipsis,
                    style: effectiveStyle,
                  ),
            secondChild: Text(
              widget.text,
              style: widget.fadeTextStyle,
            ),
            crossFadeState:
                _isExpanded ? CrossFadeState.showSecond : CrossFadeState.showFirst,
            duration: const Duration(milliseconds: 200),
          ),
        );
      },
    );
  }
}