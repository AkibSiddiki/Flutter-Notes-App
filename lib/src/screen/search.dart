import 'package:flutter/material.dart';
import 'package:notes/src/service/notes_provider.dart';
import 'package:notes/src/widget/note_card.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  SearchPageState createState() => SearchPageState();
}

class SearchPageState extends State<SearchPage> {
  final searchWordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<NotesProviders>(
      builder: ((context, notesProviders, chile) => WillPopScope(
            onWillPop: () async {
              notesProviders.resultClear();
              return true; // Allow the page to be popped
            },
            child: Scaffold(
                appBar: AppBar(
                  title: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: searchWordController,
                          decoration: const InputDecoration(
                              hintText: "Search...", border: InputBorder.none),
                        ),
                      ),
                      IconButton.filled(
                          onPressed: () {
                            notesProviders
                                .searchNotes(searchWordController.text);
                          },
                          icon: const Icon(Icons.search))
                    ],
                  ),
                ),
                body: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(children: [
                    GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisExtent: 130,
                              mainAxisSpacing: 12.0,
                              crossAxisSpacing: 12.0),
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: notesProviders.searchResult.length,
                      itemBuilder: (BuildContext context, int index) {
                        return noteCard(
                            notesProviders.searchResult[index], context);
                      },
                    ),
                  ]),
                )),
          )),
    );
  }
}
