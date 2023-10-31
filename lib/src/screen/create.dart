import 'package:flutter/material.dart';
import 'package:notes/src/service/notes_provider.dart';
import 'package:provider/provider.dart';

class CreateNote extends StatefulWidget {
  const CreateNote({super.key});

  @override
  State<CreateNote> createState() => _CreateNoteState();
}

class _CreateNoteState extends State<CreateNote> {
  final titleController = TextEditingController();
  final detailsController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<NotesProviders>(
      builder: ((context, notesProviders, child) => WillPopScope(
            onWillPop: () async {
              notesProviders.insertNote(
                titleController.text,
                detailsController.text,
              );
              return true; // Allow the page to be popped
            },
            child: Scaffold(
              appBar: AppBar(
                actions: <Widget>[
                  IconButton(
                    icon: const Icon(
                      Icons.save,
                      color: Colors.white,
                      size: 24,
                    ),
                    onPressed: () {
                      notesProviders.insertNote(
                          titleController.text, detailsController.text);
                      Navigator.pop(context);
                    },
                  ),
                  const SizedBox(
                    width: 12,
                  )
                ],
              ),
              body: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: [
                    TextField(
                      controller: titleController,
                      decoration: const InputDecoration(
                          hintText: 'Title',
                          hintStyle:
                              TextStyle(color: Colors.white54, fontSize: 22),
                          border: InputBorder.none),
                    ),
                    TextField(
                      controller: detailsController,
                      decoration: const InputDecoration(
                          hintText: 'Note',
                          hintStyle:
                              TextStyle(color: Colors.white54, fontSize: 16),
                          border: InputBorder.none),
                    )
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
