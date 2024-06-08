import 'package:flutter/material.dart';

import 'fit_button.dart';
import 'fit_text.dart';
import 'fit_theme.dart';

/// Formulaire qui contient plusieurs page.
/// Le formulaire s'occupe d'ajouter des boutons "continuer",
/// "retour" et "terminer" automatiquement.
class FitForm extends StatefulWidget {
  /// Liste des pages du formulaire.
  final List<Widget> pages;
  /// Callback lorsqu'on appuie sur le bouton de confirmation finale du formulaire.
  final Function() onEnd;

  /// Formulaire qui contient plusieurs page.
  const FitForm({super.key, required this.pages, required this.onEnd});

  @override
  State<FitForm> createState() => _FitFormState();
}

class _FitFormState extends State<FitForm> {
  static const Duration transitionDuration = Duration(milliseconds: 200);

  final PageController pageController = PageController();
  int activePage = 0;

  late Widget nextButton = Align(
    child: Container(
      width: double.infinity,
      margin: const EdgeInsets.only(right: 24, left: 24, bottom: 24),
      child: FitButton(
        onTap: () {
          if (Form.of(context).validate()) {
            pageController.nextPage(
              duration: transitionDuration,
              curve: Curves.easeIn,
            );
          }
        },
        child: const FitText.button("doContinue"),
      ),
    ),
  );

  late Widget doneButton = Align(
    child: Container(
      width: double.infinity,
      margin: const EdgeInsets.only(right: 24, left: 24, bottom: 24),
      child: FitButton(
        onTap: () {
          if (Form.of(context).validate()) {
            widget.onEnd();
          }
        },
        child: const FitText.button("done"),
      ),
    ),
  );

  late Widget backButton = Align(
    child: Container(
      width: double.infinity,
      margin: const EdgeInsets.only(right: 24, left: 24, bottom: 24),
      child: FitButton(
        onTap: () {
          pageController.previousPage(
            duration: transitionDuration,
            curve: Curves.easeIn,
          );
        },
        child: const FitText.button("back"),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: FitTheme.of(context)?.pageMargin,
      child: Builder(
        builder: (context) {
          return Column(
            children: [
              Expanded(
                child: PageView(
                  controller: pageController,
                  //physics: const NeverScrollableScrollPhysics(),
                  onPageChanged: (int page) {
                    setState(() {
                      activePage = page;
                    });
                  },
                  children: [
                    for (final page in widget.pages)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: page,
                          ),
                          if (activePage == widget.pages.length - 1)
                            doneButton
                          else
                            nextButton,
                          if (activePage != 0)
                            backButton,
                        ],
                      )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List<Widget>.generate(widget.pages.length, (index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: CircleAvatar(
                    radius: 4,
                    backgroundColor: activePage == index ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.secondary,
                  ),
                )),
              ),
            ],
          );
        },
      ),
    );
  }
}