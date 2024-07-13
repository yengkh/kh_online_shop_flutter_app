import 'package:easy_localization/easy_localization.dart' as easy_localization;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kh_online_shop_app_flutter/translations/locale_key.g.dart';

enum SingingCharacter { english, khmer }

class ProfileBottomSheet extends StatefulWidget {
  const ProfileBottomSheet({
    super.key,
  });

  @override
  State<ProfileBottomSheet> createState() => _ProfileBottomSheetState();
}

class _ProfileBottomSheetState extends State<ProfileBottomSheet> {
  SingingCharacter? _character;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _initializeSelectedLanguage();
  }

  void _initializeSelectedLanguage() {
    final currentLocale = context.locale;
    setState(() {
      if (currentLocale.languageCode == 'en') {
        _character = SingingCharacter.english;
      } else if (currentLocale.languageCode == 'km') {
        _character = SingingCharacter.khmer;
      }
    });
  }

  Future<void> _changeLanguage(SingingCharacter? value) async {
    setState(() {
      _character = value;
    });

    if (value == SingingCharacter.english) {
      await context.setLocale(const Locale('en'));
      Get.updateLocale(const Locale('en'));
    } else if (value == SingingCharacter.khmer) {
      await context.setLocale(const Locale('km'));
      Get.updateLocale(const Locale('km'));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      height: 200.0,
      width: MediaQuery.of(context).size.width,
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
              easy_localization.tr(LocaleKeys.pleaseSelectLanguage),
              style: const TextStyle(fontSize: 16.0),
            ),
            ListTile(
              leading: Image.asset(
                'assets/images/english.png',
                height: 30.0,
                width: 50.0,
              ),
              title: Text(
                easy_localization.tr(LocaleKeys.english),
                style: const TextStyle(fontSize: 14.0),
              ),
              trailing: Radio<SingingCharacter>(
                value: SingingCharacter.english,
                groupValue: _character,
                onChanged: (value) {
                  _changeLanguage(value);
                },
              ),
            ),
            ListTile(
              leading: Image.asset(
                'assets/images/cambodia.png',
                height: 30.0,
                width: 50.0,
                fit: BoxFit.cover,
              ),
              title: Text(
                easy_localization.tr(LocaleKeys.khmer),
                style: const TextStyle(fontSize: 14.0),
              ),
              trailing: Radio<SingingCharacter>(
                value: SingingCharacter.khmer,
                groupValue: _character,
                onChanged: (value) {
                  _changeLanguage(value);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
