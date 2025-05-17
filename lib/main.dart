import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skility_x/core/config/init_dependencies.dart';
import 'package:skility_x/core/config/route_config.dart';
import 'package:skility_x/view/themes/theme_manager.dart';
import 'package:toastification/toastification.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // initilizing dependencies
  await InitDependencies.initBootstraps();

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) => runApp(ProviderScope(child: const SkilityX())));
}

class SkilityX extends StatefulWidget {
  const SkilityX({super.key});

  @override
  State<SkilityX> createState() => _SkilityXState();
}

class _SkilityXState extends State<SkilityX> {
  @override
  Widget build(BuildContext context) {
    // optional but context independent
    return ToastificationWrapper(
      child: SafeArea(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: ThemeMode.dark,
          theme: ThemeManager.darkTheme,
          initialRoute: RouteEnum.splash.path,
          routes: appRoutes,
        ),
      ),
    );
  }
}
