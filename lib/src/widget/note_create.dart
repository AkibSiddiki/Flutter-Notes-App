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
          padding: const EdgeInsets.all(12.0),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(12.0)),
            color: Color.fromARGB(255, 26, 26, 26),
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Create...',
              ),
              Icon(
                Icons.add,
                color: Colors.amber,
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
