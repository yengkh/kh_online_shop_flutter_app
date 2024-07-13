import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import "package:easy_localization/easy_localization.dart";

class ShareBottomShett extends StatelessWidget {
  const ShareBottomShett({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      height: 250.0,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          const SizedBox(
            height: 20.0,
          ),
          Text(
            context.tr('shareProductToTheWorld'),
            style: const TextStyle(fontSize: 16.0),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () {},
                child: const Column(
                  children: [
                    Icon(
                      Icons.facebook_rounded,
                      size: 50.0,
                    ),
                    Text("Facebook"),
                  ],
                ),
              ),
              const SizedBox(
                width: 20.0,
              ),
              GestureDetector(
                onTap: () {},
                child: const Column(
                  children: [
                    Icon(
                      Icons.telegram_rounded,
                      size: 50.0,
                    ),
                    Text("Telegram"),
                  ],
                ),
              ),
              const SizedBox(
                width: 20.0,
              ),
              GestureDetector(
                onTap: () {},
                child: const Column(
                  children: [
                    Icon(
                      FontAwesomeIcons.instagram,
                      size: 50.0,
                    ),
                    Text("Instagram"),
                  ],
                ),
              ),
              const SizedBox(
                width: 20.0,
              ),
              GestureDetector(
                onTap: () {},
                child: const Column(
                  children: [
                    Icon(
                      FontAwesomeIcons.squareXTwitter,
                      size: 50.0,
                    ),
                    Text("X"),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
