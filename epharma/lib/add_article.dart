import 'package:flutter/material.dart';

class AddArticlePage extends StatefulWidget {
    const AddArticlePage({super.key});


@override
State<AddArticlePage> createState() => _AddArticlePageState();
}

class _AddArticlePageState extends State<AddArticlePage> {



@override
Widget build(BuildContext context) {
    return AlertDialog(
        title: const Text('Add New Article'),
        content: SingleChildScrollView(
        child: Column(
            children: [
            TextField(
                decoration: const InputDecoration(
                labelText: 'Article Name',
                ),
            ),
            TextField(
                decoration: const InputDecoration(
                labelText: 'Price',
                ),
                keyboardType: TextInputType.number,
            ),
            ],
        ),
        ),
        actions: [
        TextButton(
            onPressed: () {
            Navigator.of(context).pop();
            },
            child: const Text('Cancel'),
        ),
        ElevatedButton(
            onPressed: () {
            // Logic to add the article can be implemented here
            Navigator.of(context).pop();
            },
            child: const Text('Add'),
        ),
        ],
    );
}
}
