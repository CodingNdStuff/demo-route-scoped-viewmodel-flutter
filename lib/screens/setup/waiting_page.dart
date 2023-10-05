// ignore_for_file: unused_local_variable

import 'package:demo_navigation_vm/providers/main_view_model.dart';
import 'package:demo_navigation_vm/providers/setup_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WaitingPage extends StatefulWidget {
  static const scanRouteName = '/scanning';
  static const connectRouteName = '/connecting';
  const WaitingPage({
    super.key,
    required this.message,
    required this.onWaitComplete,
  });

  final String message;
  final VoidCallback onWaitComplete;

  @override
  State<WaitingPage> createState() => _WaitingPageState();
}

class _WaitingPageState extends State<WaitingPage> {
  @override
  void initState() {
    super.initState();
    _startWaiting();
  }

  Future<void> _startWaiting() async {
    await Future<dynamic>.delayed(const Duration(seconds: 3));

    if (mounted) {
      widget.onWaitComplete();
    }
  }

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
              const CircularProgressIndicator(),
              const SizedBox(height: 32),
              Text(widget.message),
            ],
          ),
        ),
      ),
    );
  }
}
