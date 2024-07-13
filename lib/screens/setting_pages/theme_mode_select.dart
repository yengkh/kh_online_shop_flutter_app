import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:easy_localization/easy_localization.dart';
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
  ThemeModeMap? _themeSelected;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _initTheme();
  }

  void _initTheme() {
    final currentTheme = AdaptiveTheme.of(context).mode;
    setState(() {
      _themeSelected = currentTheme == AdaptiveThemeMode.light
          ? ThemeModeMap.light
          : ThemeModeMap.dark;
    });
  }

  void _updateTheme(ThemeModeMap? value) {
    setState(() {
      _themeSelected = value;
      if (value == ThemeModeMap.light) {
        AdaptiveTheme.of(context).setLight();
      } else {
        AdaptiveTheme.of(context).setDark();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
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
            Text(
              context.tr('pleaseSelectTheme'),
              style: const TextStyle(fontSize: 16.0),
            ),
            ListTile(
              leading: const Icon(
                Icons.sunny,
                size: 20.0,
                color: Colors.orange,
              ),
              title: Text(
                context.tr('lightMode'),
                style: const TextStyle(fontSize: 14.0),
              ),
              trailing: Radio<ThemeModeMap>(
                value: ThemeModeMap.light,
                groupValue: _themeSelected,
                onChanged: _updateTheme,
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.dark_mode_rounded,
                size: 20.0,
                color: Colors.grey.shade600,
              ),
              title: Text(
                context.tr('darkMode'),
                style: const TextStyle(fontSize: 14.0),
              ),
              trailing: Radio<ThemeModeMap>(
                value: ThemeModeMap.dark,
                groupValue: _themeSelected,
                onChanged: _updateTheme,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
