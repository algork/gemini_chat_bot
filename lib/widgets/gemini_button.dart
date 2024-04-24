import 'package:flutter/material.dart';

class GeminiButton extends StatelessWidget {
  final String label;
  final IconData? icon;
  final bool isBusy;
  final void Function() onTap;
  const GeminiButton({
    super.key,
    required this.label,
    this.icon,
    required this.onTap,
    this.isBusy = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isBusy ? null : onTap,
      child: Container(
        padding: EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: isBusy ? Colors.grey.shade200 : Colors.black,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null)
                Icon(
                  icon,
                  color: Colors.white,
                ),
              if (icon != null)
                SizedBox(
                  width: 12,
                ),
              isBusy
                  ? SizedBox(
                      width: 25,
                      height: 25,
                      child: CircularProgressIndicator(
                        color: Colors.grey.shade500,
                      ))
                  : Text(
                      label,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
