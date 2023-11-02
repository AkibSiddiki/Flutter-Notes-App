import 'package:flutter/material.dart';
import 'package:notes/src/service/notes_provider.dart';
import 'package:notes/src/widget/note_card.dart';
import 'package:notes/src/widget/note_create.dart';
import 'package:provider/provider.dart';
import 'package:gap/gap.dart';

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
        shadowColor: Colors.transparent,
        title: Row(
          children: [
            Image.asset(
              'assets/icon.png',
              height: 24,
            ),
            const Gap(12),
            const Text(
              'Notes',
              style: TextStyle(fontSize: 28.0, color: Colors.amber),
            ),
          ],
        ),
        actions: [
          PopupMenuButton(
              color: Colors.white,
              itemBuilder: (context) {
                return [
                  const PopupMenuItem<int>(
                    value: 0,
                    child: Row(
                      children: [
                        Icon(
                          Icons.delete,
                          color: Colors.black,
                        ),
                        Gap(12),
                        Text(
                          "Trash",
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  // const PopupMenuItem<int>(
                  //   value: 1,
                  //   child: Row(
                  //     children: [
                  //       Icon(
                  //         Icons.settings,
                  //         color: Colors.black,
                  //       ),
                  //       Gap(12),
                  //       Text(
                  //         "Settings",
                  //         style: TextStyle(color: Colors.black),
                  //       ),
                  //     ],
                  //   ),
                  // )
                ];
              },
              onSelected: (value) {
                if (value == 0) {
                  Navigator.pushNamed(context, '/trash');
                } //else if (value == 1) {}
              }),
        ],
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
      // drawer: const MyDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Consumer<NotesProviders>(
            builder: ((context, notesProviders, chile) => Column(
                  children: <Widget>[
                    noteCreate(context),
                    GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisExtent: 130,
                              mainAxisSpacing: 12.0,
                              crossAxisSpacing: 12.0),
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
