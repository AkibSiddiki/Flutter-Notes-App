import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

Widget notice(context) {
  return Column(
    children: [
      Container(
        width: double.infinity,
        padding: const EdgeInsets.all(10.0),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(12.0)),
          color: Color.fromARGB(24, 255, 193, 7),
        ),
        child: Center(
          child: Text(
            'Deleted Notes are keeps in the trash for 30 days',
            style: TextStyle(color: Colors.amber[100]),
          ),
        ),
      ),
      const Gap(12),
    ],
  );
}
