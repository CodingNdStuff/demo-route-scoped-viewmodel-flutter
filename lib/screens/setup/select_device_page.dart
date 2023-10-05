// ignore_for_file: unused_local_variable

import 'package:demo_navigation_vm/providers/main_view_model.dart';
import 'package:demo_navigation_vm/providers/setup_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SelectDevicePage extends StatelessWidget {
  static const routeName = '/select-device';
  const SelectDevicePage({
    super.key,
    required this.onDeviceSelected,
  });

  final void Function(String deviceId) onDeviceSelected;

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
              Text(
                'Select a nearby device:',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                height: 54,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateColor.resolveWith((states) {
                      return const Color(0xFF222222);
                    }),
                  ),
                  onPressed: () {
                    onDeviceSelected('22n483nk5834');
                  },
                  child: const Text(
                    'Bulb 22n483nk5834',
                    style: TextStyle(
                      fontSize: 24,
                    ),
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
