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
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(12.0)),
        border: Border.all(
            color: n.delete == 1
                ? const Color.fromARGB(33, 247, 241, 223)
                : const Color.fromARGB(34, 255, 193, 7),
            width: 2.0),
        color: const Color.fromARGB(255, 26, 26, 26),
      ),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              n.title,
              maxLines: 2,
              style: const TextStyle(color: Colors.white, fontSize: 17),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              n.details,
              maxLines: 3,
              style: const TextStyle(
                color: Colors.white60,
                fontSize: 15,
              ),
            ),
          ]),
    ),
  );
}
