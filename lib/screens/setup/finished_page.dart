// ignore_for_file: unused_local_variable

import 'package:demo_navigation_vm/providers/main_view_model.dart';
import 'package:demo_navigation_vm/providers/setup_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FinishedPage extends StatelessWidget {
  static const routeName = '/finished';
  const FinishedPage({
    super.key,
    required this.onFinishPressed,
  });

  final VoidCallback onFinishPressed;

  @override
  Widget build(BuildContext context) {
    debugPrint("  [log] $runtimeType build called");
    final mainVM = Provider.of<MainViewModel>(context);
    final setupVM = Provider.of<SetupViewModel>(context);
    debugPrint("    [log] $runtimeType counter value : ${setupVM.counter}");

    return Scaffold(
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
                child: const Center(
                  child: Icon(
                    Icons.lightbulb,
                    size: 175,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 32),
              const Text(
                'Bulb added!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                style: ButtonStyle(
                  padding: MaterialStateProperty.resolveWith((states) {
                    return const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12);
                  }),
                  backgroundColor: MaterialStateColor.resolveWith((states) {
                    return const Color(0xFF222222);
                  }),
                  shape: MaterialStateProperty.resolveWith((states) {
                    return const StadiumBorder();
                  }),
                ),
                onPressed: onFinishPressed,
                child: const Text(
                  'Finish',
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
