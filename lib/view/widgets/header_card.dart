import 'package:flutter/material.dart';

class HeaderCard extends StatelessWidget {
  final TextTheme textTheme;
  final String textCard;
  final IconData icon;
  final Color backgroundColor;
  final double? amount;

  const HeaderCard({
    super.key,
    required this.textTheme,
    required this.textCard,
    this.icon = Icons.arrow_downward,
    this.backgroundColor = Colors.red,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        margin: const EdgeInsets.all(0),
        color: backgroundColor,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: IntrinsicHeight(
            child: Row(
              children: [
                Icon(
                  icon,
                  color: Colors.white,
                ),
                const VerticalDivider(
                  width: 20,
                  thickness: 1,
                  color: Colors.white60,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        textCard,
                        style: textTheme.bodySmall?.copyWith(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "\$ ${amount?.toStringAsFixed(2)}",
                        style:
                            textTheme.titleLarge?.copyWith(color: Colors.white),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
