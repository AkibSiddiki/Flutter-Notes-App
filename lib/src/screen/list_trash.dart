import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:notes/src/service/notes_provider.dart';
import 'package:notes/src/widget/note_card.dart';
import 'package:provider/provider.dart';

class ListTrash extends StatefulWidget {
  const ListTrash({super.key});

  @override
  State<ListTrash> createState() => _ListTrashState();
}

class _ListTrashState extends State<ListTrash> {
  @override
  void initState() {
    super.initState();
    selectNote();
  }

  selectNote() {
    final notesProvider = Provider.of<NotesProviders>(context, listen: false);
    notesProvider.selectTrashNotes();
  }

  void showDeleteConfirmationDialog(
      BuildContext context, Function onDeleteConfirmed) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: const Color.fromARGB(255, 22, 22, 22),
          title: const Text('Confirm Delete'),
          content: const Text(
              'Are you sure you want to delete all notes in the trash?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Delete'),
              onPressed: () {
                onDeleteConfirmed();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.transparent,
        title: const Text(
          'Trash',
          style: TextStyle(fontSize: 22.0, color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Consumer<NotesProviders>(
            builder: ((context, notesProviders, chile) => Column(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        showDeleteConfirmationDialog(
                          context,
                          () {
                            notesProviders.deleteTrashPermanent();
                          },
                        );
                      },
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(12.0),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(12.0)),
                          color: Color.fromARGB(255, 26, 26, 26),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.delete_forever,
                            ),
                            Gap(12),
                            Text(
                              'Clear Trash',
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Gap(12),
                    GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisExtent: 140,
                              mainAxisSpacing: 12.0,
                              crossAxisSpacing: 12.0),
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: notesProviders.trashnotes.length,
                      itemBuilder: (BuildContext context, int index) {
                        return noteCard(
                            notesProviders.trashnotes[index], context);
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
