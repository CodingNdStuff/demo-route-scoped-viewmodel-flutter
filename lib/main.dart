import 'package:demo_navigation_vm/screens/home_screen.dart';
import 'package:demo_navigation_vm/providers/main_view_model.dart';
import 'package:demo_navigation_vm/providers/setup_view_model.dart';
import 'package:demo_navigation_vm/screens/settings_screen.dart';
import 'package:demo_navigation_vm/screens/setup/setup_flow.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => MainViewModel(),
      child: MaterialApp(
        theme: ThemeData(
          brightness: Brightness.dark,
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.blue,
          ),
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
            backgroundColor: Colors.blue,
          ),
        ),
        onGenerateRoute: (settings) {
          late Widget page;
          switch (settings.name) {
            case HomeScreen.routeName:
              page = const HomeScreen();
              break;
            case SettingsScreen.routeName:
              page = const SettingsScreen();
              break;
            default:
              {
                if (settings.name!.startsWith(SetupFlow.routeName)) {
                  final subRoute =
                      settings.name!.substring(SetupFlow.routeName.length);
                  page = ChangeNotifierProvider(
                    create: (_) => SetupViewModel(),
                    child: SetupFlow(
                      setupPageRoute: subRoute,
                    ),
                  );
                } else {
                  throw Exception('Unknown route: ${settings.name}');
                }
              }
          }

          return MaterialPageRoute<dynamic>(
            builder: (context) {
              return page;
            },
            settings: settings,
          );
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
