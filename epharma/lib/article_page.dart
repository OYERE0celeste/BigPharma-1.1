import 'package:flutter/material.dart';
import 'client_page.dart';

class ArticlePage extends StatefulWidget {
  const ArticlePage({super.key});

  //final String title;

  @override
  State<ArticlePage> createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  /*void _incrementCounter() {
    setState(() {

    });
  }*/

  bool _showSearch = false;
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: !_showSearch
            ? TextField(
                controller: _searchController,
                autofocus: true,
                decoration: const InputDecoration(
                  hintText: 'Search...',
                  border: InputBorder.none,
                ),
              )
            : const Text('E-Pharma'),
        leading: PopupMenuButton<String>(
          icon: const Icon(Icons.menu),
          onSelected: (String value) {
            // Handle menu item selection
            if (value == 'Accueil') {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(const SnackBar(content: Text('Accueil selected')));
            }
            if (value == "Gestion article") {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ArticlePage()),
              );
            }
            if (value == "Gestion client") {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ClientPage()),
              );
            }
          },
          itemBuilder: (context) => [
            const PopupMenuItem(
              value: "Gestion article",
              child: Text("Gestion article"),
            ),
            const PopupMenuItem(
              value: "Gestion client",
              child: Text("Gestion client"),
            ),
            const PopupMenuItem(value: "C", child: Text("Menu Item 3")),
            const PopupMenuItem(value: "D", child: Text("Menu Item 4")),
            const PopupMenuItem(value: "E", child: Text("Menu Item 5")),
            const PopupMenuItem(value: "F", child: Text("Menu Item 6")),
          ],
        ),

        actions: [
          IconButton(
            icon: Icon(_showSearch ? Icons.close : Icons.search),
            onPressed: () {
              setState(() {
                _showSearch = !_showSearch;
              });
            },
          ),

          PopupMenuButton(
            icon: const Icon(Icons.notifications),
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: "notif1",
                child: Text("Notification 1"),
              ),
              const PopupMenuItem(
                value: "notif2",
                child: Text("Notification 2"),
              ),
            ],
          ),
          PopupMenuButton<String>(
            //Ici la photo de profil
            icon: const Icon(Icons.account_circle),
            onSelected: (String value) {
              // Handle menu item selection
              if (value == 'login') {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(const SnackBar(content: Text('Login selected')));
              }
            },
            itemBuilder: (context) => [
              const PopupMenuItem(value: "login", child: Text("Login")),
              const PopupMenuItem(value: "signup", child: Text("Sign Up")),
            ],
          ),
        ],
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: .center,
          children: [const Text('Bienvenu sur la gestion des articles')],
        ),
      ),
      /*floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),*/
    );
  }
}
