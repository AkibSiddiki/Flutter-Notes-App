import 'package:flutter/material.dart';
import 'package:notes/src/service/notes_provider.dart';
import 'package:provider/provider.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    final searchWordController = TextEditingController();

    return Row(
      children: [
        TextField(
          controller: searchWordController,
          decoration: const InputDecoration(
            hintText: "Search...",
            prefixIcon: Icon(Icons.search),
          ),
        ),
        IconButton(
            onPressed: () {
              print(searchWordController.text);
              final notesProvider =
                  Provider.of<NotesProviders>(context, listen: false);
              notesProvider.searchNotes(searchWordController.text);
            },
            icon: const Icon(Icons.search))
      ],
    );
  }
}
