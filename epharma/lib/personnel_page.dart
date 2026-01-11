import 'package:flutter/material.dart';
import 'home_page.dart';
import 'article_page.dart';
import 'client_page.dart';
import 'commande_page.dart';

class PersonnelPage extends StatefulWidget {
  const PersonnelPage({super.key});

  //final String title;

  @override
  State<PersonnelPage> createState() => _PersonnelPageState();
}

class _PersonnelPageState extends State<PersonnelPage> {
  /*void _incrementCounter() {
    setState(() {

    });
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        titleSpacing: 0,
        title: Tooltip(
          message:
              "Retourner à la page d'accueil", // texte qui apparaît au survol
          child: TextButton(
            style: ButtonStyle(
              overlayColor: WidgetStateProperty.all(
                Colors.transparent,
              ), // supprime l'effet d'éclaircissement
            ),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const HomePage()),
              );
            },
            child: const Text(
              "E-Pharma",
              style: TextStyle(
                color: Colors.white, // couleur du texte dans l’AppBar
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
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
            if (value == "Gestion commandes") {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CommandePage()),
              );
            }
            if (value == "Gestion personnel") {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PersonnelPage()),
              );
            }
          },
          itemBuilder: (context) => [
            const PopupMenuItem(
              value: "Gestion article",
              child: Text("Gestion article"),
            ),
            const PopupMenuItem(
              value: "Gestion clientèle",
              child: Text("Gestion clientèle"),
            ),
            const PopupMenuItem(
              value: "Gestion commandes",
              child: Text("Gestion commandes"),
            ),
            const PopupMenuItem(
              value: "Gestion personnel",
              child: Text("Gestion personnel"),
            ),
            const PopupMenuItem(value: "F", child: Text("Menu Item 6")),
          ],
        ),
        actions: [
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
          children: [const Text('Bienvenu sur la gestion du personnel')],
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
