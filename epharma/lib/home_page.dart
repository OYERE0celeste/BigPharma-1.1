import 'package:flutter/material.dart';
import 'article_page.dart';
import 'client_page.dart';
import 'commande_page.dart';
import 'personnel_page.dart';
import 'add_article.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  //final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // int _counter = 0;

  /*void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }*/

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.

    final List<Map<String, dynamic>> dashboardItems = [
      {
        "title": "Articles",
        "icon": Icons.medical_services,
        "page": const ArticlePage(),
      },
      {"title": "Clients", "icon": Icons.people, "page": const ClientPage()},
      {
        "title": "Ajouter Article",
        "icon": Icons.add_box,
        "page": const AddArticlePage(),
      },
      {
        "title": "Notifications",
        "icon": Icons.notifications,
        "page": null, // exemple sans navigation
      },
      {"title": "Profil", "icon": Icons.account_circle, "page": null},
    ];

    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        //title: Text(widget.title),
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
          //TextButton(
          //onPressed: () {},
          //child: const Text('Login', style: TextStyle(color: Colors.white)),
          //),
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

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // nombre de colonnes
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 1.2, // proportion largeur/hauteur
          ),
          itemCount: dashboardItems.length,
          itemBuilder: (context, index) {
            final item = dashboardItems[index];
            return GestureDetector(
              onTap: () {
                if (item["page"] != null) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => item["page"]),
                  );
                }
              },
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(item["icon"], size: 50, color: Colors.blue),
                    const SizedBox(height: 12),
                    Text(
                      item["title"],
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

/* floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}*/
