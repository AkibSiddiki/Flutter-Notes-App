import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color.fromARGB(255, 21, 21, 21),
      child: Column(
        children: [
          SizedBox(
            height: 115,
            width: double.infinity,
            child: DrawerHeader(
              child: Row(
                children: [
                  Image.asset(
                    'assets/icon.png',
                    height: 35,
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  const Text(
                    'Notes',
                    style: TextStyle(fontSize: 22.0, color: Colors.amber),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            title: const Text('Dark Mode',
                style: TextStyle(color: Colors.white, fontSize: 18)),
            trailing: Switch(
              activeColor: Colors.amber,
              value: true,
              onChanged: (value) {},
            ),
          ),
          Expanded(
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: Container(
                decoration: const BoxDecoration(
                    border: Border(top: BorderSide(color: Colors.white10))),
                child: ListTile(
                  leading: const Icon(Icons.recycling_rounded,
                      color: Colors.white, size: 25),
                  onTap: () {
                    Navigator.pushNamed(context, '/trash');
                  },
                  title: const Text(
                    'Trash',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
