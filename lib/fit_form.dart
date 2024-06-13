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

  /// Text for the continue button.
  final String? continueText;

  /// Text for the back button.
  final String? backText;

  /// Text for the done button.
  final String? doneText;

  /// App bar of the page.
  final AppBar? appBar;

  /// Formulaire qui contient plusieurs page.
  const FitForm({
    super.key,
    required this.pages,
    required this.onEnd,
    this.backText,
    this.continueText,
    this.doneText,
    this.appBar,
  });

  @override
  State<FitForm> createState() => _FitFormState();
}

class _FitFormState extends State<FitForm> {
  static const Duration transitionDuration = Duration(milliseconds: 200);

  final PageController pageController = PageController();
  int activePage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.appBar,
      body: SafeArea(
        child: Form(
          child: Container(
            margin: FitTheme.of(context)?.pageMargin,
            child: Builder(
              builder: (context) {
                return Column(
                  children: [
                    Expanded(
                      child: PageView(
                        controller: pageController,
                        physics: const NeverScrollableScrollPhysics(),
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
                                  Align(
                                    // Done button.
                                    child: Container(
                                      width: double.infinity,
                                      margin: const EdgeInsets.only(
                                          right: 24, left: 24, bottom: 24),
                                      child: FitButton(
                                        onTap: () {
                                          if (Form.of(context).validate()) {
                                            widget.onEnd();
                                          }
                                        },
                                        child: FitText.button(
                                            widget.doneText ?? "Done"),
                                      ),
                                    ),
                                  )
                                else
                                  Align(
                                    // Next button.
                                    child: Container(
                                      width: double.infinity,
                                      margin: const EdgeInsets.only(
                                          right: 24, left: 24, bottom: 24),
                                      child: FitButton(
                                        onTap: () {
                                          if (Form.of(context).validate()) {
                                            pageController.nextPage(
                                              duration: transitionDuration,
                                              curve: Curves.easeIn,
                                            );
                                          }
                                        },
                                        child: FitText.button(
                                            widget.continueText ?? "Continue"),
                                      ),
                                    ),
                                  ),
                                if (activePage != 0)
                                  Align(
                                    // Back button.
                                    child: Container(
                                      width: double.infinity,
                                      margin: const EdgeInsets.only(
                                          right: 24, left: 24, bottom: 24),
                                      child: FitButton(
                                        onTap: () {
                                          pageController.previousPage(
                                            duration: transitionDuration,
                                            curve: Curves.easeIn,
                                          );
                                        },
                                        child: FitText.button(
                                            widget.backText ?? "Back"),
                                      ),
                                    ),
                                  ),
                              ],
                            )
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List<Widget>.generate(
                          widget.pages.length,
                          (index) => Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: CircleAvatar(
                                  radius: 4,
                                  backgroundColor: activePage == index
                                      ? Theme.of(context).colorScheme.primary
                                      : Theme.of(context).colorScheme.secondary,
                                ),
                              )),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
