import 'package:flutter/material.dart';

class NavigatorTile extends StatelessWidget {
  final bool isSelected;
  final String title;
  const NavigatorTile(
      {super.key, required this.isSelected, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      padding: const EdgeInsets.all(8),
      height: 34,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), color: Colors.transparent),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).colorScheme.primary),
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 100),
              height: 2,
              width: isSelected ? title.length * 7 : 0,
              decoration:
                  BoxDecoration(color: Theme.of(context).colorScheme.surface),
            ),
          ],
        ),
      ),
    );
  }
}
