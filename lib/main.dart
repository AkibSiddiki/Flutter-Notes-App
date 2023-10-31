import 'package:notes/src/screen/create.dart';
import 'package:notes/src/screen/edit.dart';
import 'package:notes/src/service/notes_provider.dart';
import 'package:notes/src/service/sqlite_helper.dart';
import 'package:flutter/material.dart';
import 'package:notes/src/config/settings.dart';
import 'package:notes/src/config/theme_data.dart';
import 'package:notes/src/screen/list_home.dart';
import 'package:provider/provider.dart';

final dbHelper = DatabaseHelper();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // initialize the database
  await dbHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  get id => null;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => NotesProviders()..updateNotes(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'note',
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: AppSetting().themeMode,
        initialRoute: '/',
        routes: {
          '/': (context) => const ListHome(),
          '/create': (context) => const CreateNote(),
          '/edit': (context) => EditNote(id: id),
        },
      ),
    );
  }
}
