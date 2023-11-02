import 'package:flutter/material.dart';

Widget noteCreate(context) {
  return Column(
    children: [
      GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/create');
        },
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(10.0),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(12.0)),
            color: Color.fromARGB(255, 26, 26, 26),
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Take Note...',
              ),
              Icon(
                Icons.add,
              )
            ],
          ),
        ),
      ),
      const SizedBox(
        height: 12,
      ),
    ],
  );
}
