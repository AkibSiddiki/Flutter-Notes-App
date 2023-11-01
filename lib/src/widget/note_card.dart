import 'package:flutter/material.dart';
import 'package:notes/src/model/notes.dart';
import 'package:notes/src/screen/edit.dart';

Widget noteCard(Note n, context) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => EditNote(
                  id: n.id,
                )),
      );
    },
    child: Container(
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(12.0)),
        border: Border.all(
            color: const Color.fromARGB(26, 255, 192, 2), width: 2.0),
        color: const Color.fromARGB(255, 26, 26, 26),
      ),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              n.title,
              maxLines: 2,
              style: const TextStyle(color: Colors.white, fontSize: 18),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              n.details,
              maxLines: 3,
              style: const TextStyle(
                color: Colors.white60,
                fontSize: 16,
              ),
            ),
          ]),
    ),
  );
}
