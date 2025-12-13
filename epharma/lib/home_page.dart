import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        //title: Text(widget.title),
        title: const Text('E-Pharma'),
        leading: PopupMenuButton<String>(
          icon: const Icon(Icons.menu),
          onSelected: (String value) {
            // Handle menu item selection
            if (value == 'Accuei') {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(const SnackBar(content: Text('Accueil selected')));
            }
          },
          itemBuilder: (context) => [
            const PopupMenuItem(value: "A", child: Text("Menu Item 1")),
            const PopupMenuItem(value: "B", child: Text("Menu Item 2")),
            const PopupMenuItem(value: "C", child: Text("Menu Item 3")),
            const PopupMenuItem(value: "D", child: Text("Menu Item 4")),
            const PopupMenuItem(value: "E", child: Text("Menu Item 5")),
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
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: .center,
          children: [
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
