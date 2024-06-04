import 'package:flutter/material.dart';
import 'package:flutter_fit_utils_ui/flutter_fit_utils_ui.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FitTheme(
      baseTextStyle: GoogleFonts.outfit(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: const FitText("flutter_fit_utils_ui"),
          ),
          body: Container(
            margin: const EdgeInsets.only(top: 12, left: 12),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FitText.title("FitText widget:", margin: EdgeInsets.only(bottom: 12)),
                FitText.headline("Headline"),
                FitText.title("Title"),
                FitText.body("Body", style: TextStyle(color: Colors.purple)),
                FitText.button("Button"),
                FitText.tip("Tip"),
                SizedBox(height: 48),
              ],
            ),
          ),
        ),
      ),
    );
  }
}