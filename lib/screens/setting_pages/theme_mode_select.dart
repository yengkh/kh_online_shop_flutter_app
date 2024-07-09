import 'package:flutter/material.dart';

enum ThemeModeMap { dark, light }

class ThemeModeSelect extends StatefulWidget {
  const ThemeModeSelect({
    super.key,
  });

  @override
  State<ThemeModeSelect> createState() => _ThemeModeSelectState();
}

class _ThemeModeSelectState extends State<ThemeModeSelect> {
  ThemeModeMap? _themeSelected = ThemeModeMap.dark;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 8.0,
            ),
            Center(
              child: Container(
                height: 5.0,
                width: 40.0,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20.0),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            const Text(
              "Please select the Theme Mode",
              style: TextStyle(fontSize: 16.0),
            ),
            ListTile(
              leading: Icon(
                Icons.dark_mode_rounded,
                size: 20.0,
                color: Colors.grey.shade600,
              ),
              title: const Text(
                "Dark Mode",
                style: TextStyle(fontSize: 14.0),
              ),
              trailing: Radio<ThemeModeMap>(
                value: ThemeModeMap.dark,
                groupValue: _themeSelected,
                onChanged: (ThemeModeMap? value) {
                  setState(() {
                    _themeSelected = value;
                  });
                },
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.sunny,
                size: 20.0,
                color: Colors.orange,
              ),
              title: const Text(
                "Light Mode",
                style: TextStyle(fontSize: 14.0),
              ),
              trailing: Radio<ThemeModeMap>(
                value: ThemeModeMap.light,
                groupValue: _themeSelected,
                onChanged: (ThemeModeMap? value) {
                  setState(() {
                    _themeSelected = value;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
