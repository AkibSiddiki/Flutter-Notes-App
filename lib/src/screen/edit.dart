import 'package:flutter/material.dart';
import 'package:notes/src/model/notes.dart';
import 'package:notes/src/service/notes_provider.dart';
import 'package:provider/provider.dart';

class EditNote extends StatefulWidget {
  final int id;

  const EditNote({Key? key, required this.id}) : super(key: key);

  @override
  State<EditNote> createState() => _EditNoteState();
}

class _EditNoteState extends State<EditNote> {
  late TextEditingController titleController;
  late TextEditingController detailsController;
  bool _loading = true;
  late Note pnote;

  @override
  void initState() {
    super.initState();
    selectNote();
  }

  selectNote() async {
    final notesProvider = Provider.of<NotesProviders>(context, listen: false);
    final Note note = await notesProvider.selectNote(widget.id);
    setState(() {
      pnote = note;
      titleController = TextEditingController(text: note.title);
      detailsController = TextEditingController(text: note.details);
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final notesProvider =
            Provider.of<NotesProviders>(context, listen: false);
        notesProvider.updateNote(
            widget.id, titleController.text, detailsController.text);
        return true; // Allow the page to be popped
      },
      child: Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.delete,
                color: Colors.white,
                size: 24,
              ),
              onPressed: () {
                final notesProvider =
                    Provider.of<NotesProviders>(context, listen: false);
                if (pnote.delete == 0) {
                  notesProvider.deleteNote(widget.id);
                } else {
                  notesProvider.deleteNotePermanent(widget.id);
                }
                Navigator.pop(context);
              },
            ),
            IconButton(
              icon: const Icon(
                Icons.check,
                color: Colors.white,
                size: 24,
              ),
              onPressed: () {
                final notesProvider =
                    Provider.of<NotesProviders>(context, listen: false);
                notesProvider.updateNote(
                    widget.id, titleController.text, detailsController.text);
                Navigator.pop(context);
              },
            ),
            const SizedBox(
              width: 12,
            )
          ],
        ),
        body: _loading
            ? const SizedBox()
            : Padding(
                padding: const EdgeInsets.all(12),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      TextField(
                        controller: titleController,
                        style: const TextStyle(fontSize: 22.0),
                        minLines: 1,
                        maxLines: 4,
                        decoration: const InputDecoration(
                          hintText: 'Title',
                          hintStyle:
                              TextStyle(color: Colors.white54, fontSize: 22),
                          border: InputBorder.none,
                        ),
                      ),
                      TextField(
                        controller: detailsController,
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        decoration: const InputDecoration(
                          hintText: 'Note',
                          hintStyle:
                              TextStyle(color: Colors.white54, fontSize: 16),
                          border: InputBorder.none,
                        ),
                      )
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
