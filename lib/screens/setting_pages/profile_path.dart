import 'package:flutter/material.dart';

class ProfilePath extends StatelessWidget {
  const ProfilePath({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey.shade200,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Container(
        padding: const EdgeInsets.only(
          top: 10.0,
          left: 20.0,
          right: 20.0,
          bottom: 10.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 30.0,
              child: Icon(Icons.person),
            ),
            const SizedBox(
              height: 15.0,
            ),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text("Name : "),
                    Text("Chann Yeng"),
                  ],
                ),
                Row(
                  children: [
                    Text("Email : "),
                    Text("channyeng@gmail.com"),
                  ],
                ),
                Row(
                  children: [
                    Text("Phone Number : "),
                    Text("016 52 20 78"),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 15.0,
            ),
            TextButton(
              style: const ButtonStyle(
                padding: WidgetStatePropertyAll(
                    EdgeInsets.symmetric(horizontal: 60.0)),
                backgroundColor: WidgetStatePropertyAll(Colors.blue),
              ),
              onPressed: () {},
              child: const Text(
                "Edit profile",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
