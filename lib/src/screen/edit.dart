import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:notes/src/model/notes.dart';
import 'package:notes/src/service/notes_provider.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

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

  String dateTimeFormate(String dt) {
    DateTime dateTime = DateTime.parse(dt);
    return DateFormat("dd MMM").format(dateTime);
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
      child: _loading
          ? const Scaffold()
          : Scaffold(
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
                    icon: pnote.delete == 0
                        ? const Icon(
                            Icons.check,
                            color: Colors.white,
                            size: 24,
                          )
                        : const Icon(
                            Icons.restore,
                            color: Colors.white,
                            size: 24,
                          ),
                    onPressed: () {
                      final notesProvider =
                          Provider.of<NotesProviders>(context, listen: false);
                      notesProvider.updateNote(widget.id, titleController.text,
                          detailsController.text);
                      if (pnote.delete == 1) {
                        notesProvider.restoreNote(widget.id);
                      }
                      Navigator.pop(context);
                    },
                  ),
                  const Gap(12)
                ],
              ),
              body: Padding(
                padding: const EdgeInsets.all(12),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                      Text(
                        dateTimeFormate(pnote.updateDatetime),
                        style: TextStyle(fontSize: 14, color: Colors.grey[400]),
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
