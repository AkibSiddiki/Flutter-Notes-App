import 'package:flutter/material.dart';
import 'package:notes/src/screen/list_trash.dart';
import 'package:provider/provider.dart';
import 'package:notes/src/screen/create.dart';
import 'package:notes/src/screen/splash_screen.dart';
import 'package:notes/src/service/notes_provider.dart';
import 'package:notes/src/service/sqlite_helper.dart';
import 'package:notes/src/config/settings.dart';
import 'package:notes/src/config/theme_data.dart';
import 'package:notes/src/screen/list_home.dart';

final dbHelper = DatabaseHelper();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // initialize the database
  await dbHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => NotesProviders()
            ..selectNotes()
            ..selectTrashNotes(),
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
          '/': (context) => const SplashScreen(),
          '/home': (context) => const ListHome(),
          '/create': (context) => const CreateNote(),
          '/trash': (context) => const ListTrash(),
        },
      ),
    );
  }
}
