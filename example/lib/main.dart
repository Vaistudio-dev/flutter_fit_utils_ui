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
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ExpansionTile(
                    title: FitText.title("FitText"),
                    children: [
                      FitText.headline("Headline"),
                      FitText.title("Title"),
                      FitText.body("Body", style: TextStyle(color: Colors.purple)),
                      FitText.button("Button", style: TextStyle(color: Colors.black)),
                      FitText.tip("Tip"),
                    ],
                  ),
                  ExpansionTile(
                    title: const FitText.title("FitLoadingIndicator"),
                    children: [
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
                  const ExpansionTile(
                    title: FitText.title("FitTextIcon"),
                    children: [
                      FitText.body("Default"),
                      FitTextIcon(
                        text: FitText.body("Information"),
                        icon: Icon(Icons.abc),
                      ),
                      SizedBox(height: 12),
                      FitText.body("Custom"),
                      FitTextIcon(
                        text: FitText.body("Information"),
                        icon: Icon(Icons.book),
                        themeData: FitTextIconThemeData(
                          spacing: 12,
                          contentOrder: TextIconOrder.ti,
                        ),
                      ),
                    ],
                  ),
                  const ExpansionTile(
                    title: FitText.title("FitLoadingHandler"),
                    children: [
                      LoadingHandlerExample(),
                    ],
                  ),
                  ExpansionTile(
                    title: const FitText.title("FitDiaporama"),
                    children: [
                      SizedBox(
                        height: 100,
                        width: MediaQuery.of(context).size.width,
                        child: const FitDiaporama(
                          images: [
                            NetworkImage("https://avatars.githubusercontent.com/u/14101776?s=280&v=4"),
                            NetworkImage("https://upload.wikimedia.org/wikipedia/commons/thumb/4/44/Google-flutter-logo.svg/2560px-Google-flutter-logo.svg.png"),
                          ],
                        ),
                      ),
                    ],
                  ),
                  ExpansionTile(
                    title: const FitText.title("FitImageCard"),
                    children: [
                      Container(
                        margin: const EdgeInsets.all(12),
                        child: FitImageCard(
                          onTap: () {},
                          image: const NetworkImage("https://avatars.githubusercontent.com/u/14101776?s=280&v=4"),
                          title: "Flutter",
                          description: "Flutter is awesome!",
                        ),
                      ),
                    ],
                  ),
                  ExpansionTile(
                    title: const FitText.title("FitButton"),
                    children: [
                      FitButton(
                        onTap: () {},
                        child: const FitText.button("Save"),
                      ),
                      FitButton(
                        onTap: () {},
                        child: const Icon(Icons.save),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class LoadingHandlerExample extends StatefulWidget {
  const LoadingHandlerExample({super.key});

  @override
  State<LoadingHandlerExample> createState() => _LoadingHandlerExampleState();
}

class _LoadingHandlerExampleState extends State<LoadingHandlerExample> {
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return FitLoadingHandler(
      loading: loading,
      child: FloatingActionButton.small(
        onPressed: () => setState(() {
          loading = true;
        }),
        child: const Icon(Icons.start),
      )
    );
  }
}