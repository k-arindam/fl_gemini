import 'package:fl_gemini_client/fl_gemini_client.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  await FLGeminiClient.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? value;

  final _flGemini = FLGeminiClient();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          debugPrint((_flGemini is FlGeminiIos).toString());

          final resp = await _flGemini.getPlatformVersion();

          setState(() {
            value = resp;
          });
        },
        child: const Icon(
          Icons.info_outline_rounded,
        ),
      ),
      body: Center(
        child: Text(
          value ?? "No Data",
        ),
      ),
    );
  }
}
