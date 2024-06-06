import 'package:flutter/material.dart';
import 'package:flutter_fit_utils_ui/fit_loading_indicator.dart';
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
      baseTextStyle: GoogleFonts.overpass(),
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const FitText.title("FitText",
                    margin: EdgeInsets.only(bottom: 12)),
                const FitText.headline("Headline"),
                const FitText.title("Title"),
                const FitText.body("Body", style: TextStyle(color: Colors.purple)),
                const FitText.button("Button"),
                const FitText.tip("Tip"),
                const SizedBox(height: 48),
                const FitText.title("FitLoadingIndicator",
                    margin: EdgeInsets.only(bottom: 12)),
                const FitText.body("Default"),
                const FitLoadingIndicator(),
                const SizedBox(height: 12),
                const FitText.body("Customize it with ProgressIndicatorThemeData"),
                Theme(
                  data: ThemeData(
                    progressIndicatorTheme: const ProgressIndicatorThemeData(
                      color: Colors.red,
                    )
                  ),
                  child: const FitLoadingIndicator(size: Size(25, 25))
                ),
                const SizedBox(height: 12),
                const FitText.body("Change the alignment"),
                const FitLoadingIndicator(alignment: Alignment.centerLeft),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
