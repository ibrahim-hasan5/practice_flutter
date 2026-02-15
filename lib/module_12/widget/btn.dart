import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class build_button extends StatelessWidget {
  final String text;
  final Color? color;
  final Color? textColor;
  final VoidCallback onclick;

  const build_button({
    super.key,
    required this.onclick,
    required this.text,
    this.color,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              HapticFeedback.lightImpact();
              onclick();
            },
            borderRadius: BorderRadius.circular(20),
            child: Container(
              decoration: BoxDecoration(
                color: color ?? Colors.grey[850],
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    offset: Offset(0, 2),
                    blurRadius: 4,
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  text,
                  style: TextStyle(
                    fontSize: 28,
                    color: textColor ?? Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              height: 70,
            ),
          ),
        ),
      ),
    );
  }
}