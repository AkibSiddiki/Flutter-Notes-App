import 'package:flutter/material.dart';
import 'package:notes/src/service/notes_provider.dart';
import 'package:notes/src/widget/note_card.dart';
import 'package:notes/src/widget/note_create.dart';
import 'package:provider/provider.dart';

class ListHome extends StatefulWidget {
  const ListHome({super.key});

  @override
  State<ListHome> createState() => _ListHomeState();
}

class _ListHomeState extends State<ListHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Notes',
          style: TextStyle(fontSize: 40.0, color: Colors.amber),
        ),
        // actions: <Widget>[
        //   IconButton(
        //     icon: const Icon(
        //       Icons.search,
        //       color: Colors.white70,
        //       size: 32,
        //     ),
        //     onPressed: () {
        //       // do something
        //     },
        //   ),
        //   IconButton(
        //     icon: const Icon(
        //       Icons.settings,
        //       color: Colors.white70,
        //       size: 32,
        //     ),
        //     onPressed: () {
        //       // do something
        //     },
        //   ),
        //   const SizedBox(
        //     width: 12,
        //   )
        // ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/create');
        },
        backgroundColor: Colors.amber,
        child: const Icon(
          Icons.add,
          color: Colors.black,
        ), // You can change the icon as needed
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Consumer<NotesProviders>(
            builder: ((context, notesProviders, chile) => Column(
                  children: <Widget>[
                    noteCreate(context),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: notesProviders.notes.length,
                      itemBuilder: (BuildContext context, int index) {
                        return noteCard(notesProviders.notes[index], context);
                      },
                    ),
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
