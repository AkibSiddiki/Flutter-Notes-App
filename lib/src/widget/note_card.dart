import 'package:flutter/material.dart';
import 'package:notes/src/model/notes.dart';
import 'package:notes/src/screen/edit.dart';

Widget noteCard(Note n, context) {
  return Column(
    children: [
      GestureDetector(
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
          width: double.infinity,
          padding: const EdgeInsets.all(12.0),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(12.0)),
            color: Color.fromARGB(255, 26, 26, 26),
          ),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  n.title,
                  style: const TextStyle(color: Colors.white, fontSize: 18),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  n.details,
                  style: const TextStyle(
                    color: Colors.white60,
                    fontSize: 16,
                  ),
                  maxLines: 4,
                ),
              ]),
        ),
      ),
      const SizedBox(
        height: 12,
      ),
    ],
  );
}
