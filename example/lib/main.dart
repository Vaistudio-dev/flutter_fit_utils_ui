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
      pageMargin: const EdgeInsets.all(12),
      child: Builder(
        builder: (context) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
              inputDecorationTheme: InputDecorationTheme(
                border: OutlineInputBorder(
                  borderRadius: FitTheme.of(context)!.innerRadius,
                ),
              )
            ),
            home: Scaffold(
              appBar: AppBar(
                backgroundColor: Theme.of(context).colorScheme.inversePrimary,
                title: const FitText("flutter_fit_utils_ui"),
              ),
              body: Builder(
                builder: (context) {
                  return Container(
                    margin: const EdgeInsets.only(top: 12, left: 12),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const ExpansionTile(
                            title: FitText.title("FitText"),
                            children: [
                              FitText.headline("Headline"),
                              FitText.title("Title"),
                              FitText.body("Body", style: TextStyle(color: Colors.purple)),
                              FitText.button("Button", style: TextStyle(color: Colors.black)),
                              FitText.hint("Hint"),
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
                          const ExpansionTile(
                            title: FitText.title("FitTextInput"),
                            children: [
                              SizedBox(height: 12),
                              FitTextInput(
                                label: "Name",
                                margin: EdgeInsets.symmetric(horizontal: 12),
                              ),
                              SizedBox(height: 12),
                            ],
                          ),
                          const ExpansionTile(
                            title: FitText.title("FitChips"),
                            children: [
                              FitChip(text: "Chip"),
                              FitRadioChips(
                                title: "Options",
                                options: [
                                  "Chip 1",
                                  "Chip 2",
                                  "Chip 3",
                                  "Chip 4",
                                  "Chip 5",
                                ],
                              ),
                            ],
                          ),
                          const ExpansionTile(
                            title: FitText.title("FitRadioCards"),
                            children: [
                              FitRadioCards(
                                title: FitText.title("Options"),
                                options: [
                                  ("Option 1", "Lorem Ipsum"),
                                  ("Option 2", "Lorem Ipsum"),
                                  ("Option 3", "Lorem Ipsum"),
                                  ("Option 4", "Lorem Ipsum"),
                                ],
                              ),
                            ],
                          ),
                          ExpansionTile(
                            title: const FitText.title("FitSwipeable"),
                            children: [
                              FitSwipeable(
                                options: SwipeOption.add(
                                  onSwiped: () {
                                    context.showSnackbar("Swiped!");
                                  },
                                  background: Container(
                                    color: Theme.of(context).colorScheme.primary,
                                    child: Icon(Icons.add, color: Theme.of(context).colorScheme.onPrimary),
                                  )
                                ),
                                child: const FitText.body("Swipe me"),
                              ),
                              FitSwipeable(
                                options: SwipeOption.delete(
                                  onSwiped: () {
                                    context.showSnackbar("Deleted :(");
                                  },
                                  background: Container(
                                    color: Theme.of(context).colorScheme.error,
                                    child: Icon(Icons.delete, color: Theme.of(context).colorScheme.onError),
                                  )
                                ),
                                child: const FitText.body("Delete me"),
                              ),
                            ],
                          ),
                          ExpansionTile(
                            title: const FitText.title("FitSettings"),
                            children: [
                              FitButton(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(builder: (context) => const ExampleSettings())
                                  );
                                },
                                child: const FitText.button("Go to settings"),
                              ),
                            ],
                          ),
                          ExpansionTile(
                            title: const FitText.title("FitForm"),
                            children: [
                              FitButton(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(builder: (context) => const ExampleForm())
                                  );
                                },
                                child: const FitText.button("Go to form"),
                              ),
                            ],
                          ),
                          ExpansionTile(
                            title: const FitText.title("FitMenu"),
                            children: [
                              FitButton(
                                onTap: () {
                                  showFitMenu(
                                    context,
                                    FitMenu(
                                      mainIcon: Icons.menu,
                                      title: "Fit Menu",
                                      subTitle: "Looks nice doesn't it ?",
                                      menuItems: [
                                        FitMenuItem(
                                          icon: Icons.abc,
                                          title: "Item 1",
                                          onTap: (context, item) {
                                            context.showSnackbar("Hello from item 1 !");
                                          }
                                        ),
                                        FitMenuItem(
                                          icon: Icons.home,
                                          title: "Item 2",
                                          onTap: (context, item) {
                                            context.showSnackbar("Hello from item 2 !");
                                          }
                                        ),
                                        FitMenuItem(
                                          icon: Icons.book,
                                          title: "Item 3",
                                          onTap: (context, item) {
                                            context.showSnackbar("Hello from item 3 !");
                                          }
                                        ),
                                      ],
                                    ),
                                  );
                                },
                                child: const FitText.button("Open menu"),
                              ),
                            ],
                          ),
                          const ExpansionTile(
                            title: FitText.title("FitSort"),
                            children: [
                              FitSortExample(),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                }
              ),
            ),
          );
        }
      ),
    );
  }
}

class FitSortExample extends StatefulWidget {
  const FitSortExample({super.key});

  @override
  State<FitSortExample> createState() => _FitSortExampleState();
}

class _FitSortExampleState extends State<FitSortExample> {
  List<Sortable> data = [
    ExampleClass("a"),
    ExampleClass("b"),
    ExampleClass("c"),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FitSort(
          data: data,
          availableAlgorithms: [AToZSort(), ZToASort()],
          onSortChanged: (newData, sort) {
            setState(() {
              data = newData;
            });
          },
        ),
        for (final d in data)
          ListTile(
            title: FitText.body(d.getComparator().toString()),
          ),
      ],
    );
  }
}

class ExampleClass implements Sortable {
  final String data;

  ExampleClass(this.data);

  @override
  Object getComparator() => data;
}

class ExampleForm extends StatefulWidget {
  const ExampleForm({super.key});

  @override
  State<ExampleForm> createState() => _ExampleFormState();
}

class _ExampleFormState extends State<ExampleForm> {
  @override
  Widget build(BuildContext context) {
    return FitForm(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const FitText("Example Form"),
      ),
      onEnd: () {
        Navigator.of(context).pop();
      },
      pages: const [
        FitText.headline("Page 1"),
        FitText.headline("Page 2"),
        FitText.headline("Page 3"),
      ],
    );
  }
}

class ExampleSettings extends StatelessWidget {
  const ExampleSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return FitPage(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const FitText("Example Settings"),
      ),
      children: const [
        SettingSection(
          title: "Section #1",
          children: [
            FitSettingItem(title: "Name", subtitle: "John Doe"),
            FitSettingItem(title: "Address", subtitle: "Place 123 drive"),
            FitSettingItem(title: "Name", subtitle: "John Doe"),
            FitSettingsCruncher(
              crunchText: "Info",
              children: [
                FitSettingItem(title: "Name", subtitle: "John Doe"),
                FitSettingItem(title: "Address", subtitle: "Place 123 drive"),
                FitSettingItem(title: "Name", subtitle: "John Doe"),
              ],
            ),
          ],
        ),
        SettingSection(
          title: "Section #2",
          children: [
            FitSettingsCruncher(
              crunchText: "Info",
              children: [
                FitSettingsCruncher(
                  crunchText: "Sub info",
                  children: [
                    FitSettingItem(title: "Name", subtitle: "John Doe"),
                    FitSettingItem(title: "Address", subtitle: "Place 123 drive"),
                    FitSettingItem(title: "Name", subtitle: "John Doe"),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
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