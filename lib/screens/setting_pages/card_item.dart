import 'package:flutter/material.dart';

class CardItem extends StatelessWidget {
  const CardItem({
    super.key,
    this.onTapEvent,
    required this.title,
    required this.description,
    required this.iconsData,
    this.trailingEvent,
  });
  final Function()? onTapEvent;
  final String title;
  final String description;
  final IconData iconsData;
  final Function()? trailingEvent;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapEvent,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Card(
          color: Colors.grey.shade200,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          iconsData,
                          color: Colors.blue,
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          title,
                          style: const TextStyle(fontSize: 16.0),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      description,
                      style: const TextStyle(fontSize: 12.0),
                    ),
                  ],
                ),
                IconButton(
                  onPressed: trailingEvent,
                  icon: Icon(
                    Icons.arrow_forward_ios_outlined,
                    size: 20.0,
                    color: Colors.grey.shade700,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
