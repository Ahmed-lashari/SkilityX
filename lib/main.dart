import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:skility_x/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const SkilityX());
}

class SkilityX extends StatefulWidget {
  const SkilityX({super.key});

  @override
  State<SkilityX> createState() => _SkilityXState();
}

class _SkilityXState extends State<SkilityX> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
