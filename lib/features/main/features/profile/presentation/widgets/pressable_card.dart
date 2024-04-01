import 'package:flutter/material.dart';

class PressableCard extends StatefulWidget {
  final Widget child;
  final VoidCallback onTap;

  const PressableCard({Key? key, required this.child, required this.onTap}) : super(key: key);

  @override
  _PressableCardState createState() => _PressableCardState();
}

class _PressableCardState extends State<PressableCard> {

  void _onTapDown(TapDownDetails details) {
    setState(() {
    });
  }

  void _onTapUp(TapUpDetails details) {
    setState(() {
    });
  }

  void _onTapCancel() {
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: _onTapCancel,
      onTap: widget.onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        decoration: BoxDecoration(
          // color: _isPressed ? Colors.grey[300] : Colors.white, // Simulate shadow color change
          borderRadius: BorderRadius.circular(10),),
        //   boxShadow: _isPressed
        //       ? []
        //       : [ // Simulate elevation by adding shadow
        //           BoxShadow(
        //             color: Colors.black.withOpacity(0.2),
        //             blurRadius: 8,
        //             offset: const Offset(0, 2),
        //           ),
        //         ],
        // ),
        child: widget.child,
      ),
    );
  }
}
