import 'package:demo_navigation_vm/screens/setup/finished_page.dart';
import 'package:demo_navigation_vm/screens/setup/select_device_page.dart';
import 'package:demo_navigation_vm/screens/setup/waiting_page.dart';
import 'package:flutter/material.dart';

@immutable
class SetupFlow extends StatefulWidget {
  static const routeName = '/setup';
  static SetupFlowState of(BuildContext context) {
    return context.findAncestorStateOfType<SetupFlowState>()!;
  }

  const SetupFlow({
    super.key,
    required this.setupPageRoute,
  });

  final String setupPageRoute;

  @override
  SetupFlowState createState() => SetupFlowState();
}

class SetupFlowState extends State<SetupFlow> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  @override
  void initState() {
    super.initState();
  }

  void _onDiscoveryComplete() {
    _navigatorKey.currentState!.pushNamed(SelectDevicePage.routeName);
  }

  void _onDeviceSelected(String deviceId) {
    _navigatorKey.currentState!.pushNamed(WaitingPage.connectRouteName);
  }

  void _onConnectionEstablished() {
    _navigatorKey.currentState!.pushNamed(FinishedPage.routeName);
  }

  Future<void> _onExitPressed() async {
    final isConfirmed = await _isExitDesired();

    if (isConfirmed && mounted) {
      _exitSetup();
    }
  }

  Future<bool> _isExitDesired() async {
    return await showDialog<bool>(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('Are you sure?'),
                content: const Text(
                    'If you exit device setup, your progress will be lost.'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(true);
                    },
                    child: const Text('Leave'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                    child: const Text('Stay'),
                  ),
                ],
              );
            }) ??
        false;
  }

  void _exitSetup() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _isExitDesired,
      child: Scaffold(
        appBar: _buildFlowAppBar(),
        body: Navigator(
          key: _navigatorKey,
          initialRoute: widget.setupPageRoute,
          onGenerateRoute: _onGenerateRoute,
        ),
      ),
    );
  }

  Route _onGenerateRoute(RouteSettings settings) {
    late Widget page;
    switch (settings.name) {
      case WaitingPage.scanRouteName:
        page = WaitingPage(
          message: 'Searching for nearby bulb...',
          onWaitComplete: _onDiscoveryComplete,
        );
        break;
      case SelectDevicePage.routeName:
        page = SelectDevicePage(
          onDeviceSelected: _onDeviceSelected,
        );
        break;
      case WaitingPage.connectRouteName:
        page = WaitingPage(
          message: 'Connecting...',
          onWaitComplete: _onConnectionEstablished,
        );
        break;
      case FinishedPage.routeName:
        page = FinishedPage(
          onFinishPressed: _exitSetup,
        );
        break;
      default:
        page = WaitingPage(
          message: 'Searching for nearby bulb...',
          onWaitComplete: _onDiscoveryComplete,
        );
        break;
    }

    return MaterialPageRoute<dynamic>(
      builder: (context) {
        return page;
      },
      settings: settings,
    );
  }

  PreferredSizeWidget _buildFlowAppBar() {
    return AppBar(
      leading: IconButton(
        onPressed: _onExitPressed,
        icon: const Icon(Icons.chevron_left),
      ),
      title: const Text('Bulb Setup'),
    );
  }
}
