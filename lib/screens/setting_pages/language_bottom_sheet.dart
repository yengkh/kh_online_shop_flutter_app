import 'package:flutter/material.dart';

enum SingingCharacter { english, khmer }

class ProfileBottomSheet extends StatefulWidget {
  const ProfileBottomSheet({
    super.key,
  });

  @override
  State<ProfileBottomSheet> createState() => _ProfileBottomSheetState();
}

class _ProfileBottomSheetState extends State<ProfileBottomSheet> {
  SingingCharacter? _character = SingingCharacter.english;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: const BorderRadius.only(
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
            const Text(
              "Please select your language",
              style: TextStyle(fontSize: 16.0),
            ),
            ListTile(
              leading: Image.asset(
                'assets/images/english.png',
                height: 30.0,
                width: 50.0,
              ),
              title: const Text(
                "English",
                style: TextStyle(fontSize: 14.0),
              ),
              trailing: Radio<SingingCharacter>(
                value: SingingCharacter.english,
                groupValue: _character,
                onChanged: (SingingCharacter? value) {
                  setState(() {
                    _character = value;
                  });
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
              title: const Text(
                "Khmer",
                style: TextStyle(fontSize: 14.0),
              ),
              trailing: Radio<SingingCharacter>(
                value: SingingCharacter.khmer,
                groupValue: _character,
                onChanged: (SingingCharacter? value) {
                  setState(() {
                    _character = value;
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
