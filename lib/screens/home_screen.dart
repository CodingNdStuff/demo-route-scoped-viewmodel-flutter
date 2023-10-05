// ignore_for_file: unused_local_variable

import 'package:demo_navigation_vm/providers/main_view_model.dart';
import 'package:demo_navigation_vm/screens/settings_screen.dart';
import 'package:demo_navigation_vm/screens/setup/setup_flow.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

@immutable
class HomeScreen extends StatelessWidget {
  static const routeName = '/';
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    debugPrint("  [log] $runtimeType build called");
    final mainVM = Provider.of<MainViewModel>(context);

    return Scaffold(
      appBar: _buildAppBar(context),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 250,
                height: 250,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFF222222),
                ),
                child: Center(
                  child: Icon(
                    Icons.lightbulb,
                    size: 175,
                    color: Theme.of(context).scaffoldBackgroundColor,
                  ),
                ),
              ),
              const SizedBox(height: 32),
              const Text(
                'Add your first bulb',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(SetupFlow.routeName);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      title: const Text('Welcome'),
      actions: [
        IconButton(
          icon: const Icon(Icons.settings),
          onPressed: () {
            Navigator.pushNamed(context, SettingsScreen.routeName);
          },
        ),
      ],
    );
  }
}
