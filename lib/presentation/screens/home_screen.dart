import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.square),
            title: const Text('Cubits'),
            subtitle: const Text('Gestor de estado simple.'),
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
            onTap: () {
              context.push('/cubits');
            },
          ),
          ListTile(
            leading: const Icon(Icons.book),
            title: const Text('BLoC'),
            subtitle: const Text('Gestor de estado complejo.'),
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
            onTap: () {
              context.push('/bloc');
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Divider(),
          ),
        ],
      ),
    );
  }
}
