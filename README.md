A flutter package that offers pre-built UI components to build your UI faster. This package is part of the flutter_fit_utils environement.

## Features

A flutter package that offers a wide variety of UI tools to make your apps faster, and more efficiently. There are 15+ prebuilt widgets available to use in just a few lines of code.

<img src="https://github.com/s0punk/flutter_fit_utils_ui/assets/59456672/9660a4f5-2b01-4911-a6e1-aa4858094997" width="200" />

Available widgets:
- FitText: Create headlines, titles, body text and hints with a single line of code.
- FitLoadingIndicator: Auto aligned circular loading indicator that will always fit with your app theme.
- FitTextIcon: Pair an icon with a text and vice-versa easily.
- FitLoadingHandler: Use this to block input and show that your widget is loading.
- FitDiaporama: Customizable diaporama that accept any type of image.
- FitImageCard: A card with a background image. The card's text will always be readable, no matter what image you use.
- FitButton: Buttons made easy, without the need to repeat code everywhere.
- FitTextInput: A nice wrapper for TextFormField.
- FitChips: Chips that you can use as radio buttons.
- FitRadioCards: Beautiful cards that you can use as radio buttons.
- FitSwipeable: Make any widget swipeable easily, with not much code.
- FitSettings: Create settings page easily.

<img src="https://github.com/s0punk/flutter_fit_utils_ui/assets/59456672/441d2c7d-0248-4276-9267-5cc2ba136bc4" width="200"/>  <img src="https://github.com/s0punk/flutter_fit_utils_ui/assets/59456672/7a6b7023-b6a6-453b-a5f1-65c03b7f1f72" style="margin-left: 10px;" width="200"/>


- FitForm: Create forms with less code.

<img src="https://github.com/s0punk/flutter_fit_utils_ui/assets/59456672/62719e3d-acb0-49fb-8b93-3c8d7274ee3e" width="200"/> <img src="https://github.com/s0punk/flutter_fit_utils_ui/assets/59456672/eadf541c-cf2c-40f4-8ee3-38bf3f070c9c" width="200"/> <img src="https://github.com/s0punk/flutter_fit_utils_ui/assets/59456672/c90f666e-0580-4db3-8c89-df3f3bbf930d" width="200"/>

- FitMenu: Create beautiful drawer menus easily.
<img src="https://github.com/s0punk/flutter_fit_utils_ui/assets/59456672/393213c0-8925-4a68-a45d-5bdffa070aa4" width="200" />

- FitSort: Sort a collection with prebuilt and customizable sort algorithms.
- FitRuleValidator: Visualize how many steps/rule have been completed/respected.
- FitDialog: Easily show dialogs with FitDialog.show().

## Getting started

- Go inside your pubspec.yaml file
- Add this line under the dependencies:
```
flutter_fit_utils_ui: ^1.7.10
```
- Get dependencies
```
flutter pub get
```

## Usage

### The FitTheme Widget

To have more control over the fit widgets, you can start be wrapping a ```dart FitTheme ``` around your widget tree.
This class lets you change:
- The base text style for all FitTexts
- The size of loading indicators
- The theme data of FitTextIcons
- The loading behavior of FitLoadingHandlers
- The basic page margin
- The base radius

These properties are all used by the different widgets offered by this package.

### Other Widgets

All widgets are simple to use, and only need a few lines of code to use theme. For example, this is how a FitText is called:

```dart
FitText.headline("Your Headline Here")
```

To learn more about the other widgets available, please checkout the example/main.dart file. This example covers all the available widgets.

## Additional information

Feel free to [give any feedback](https://github.com/Vaistudio-dev/flutter_fit_utils_ui/issues) ! This package is also open to contributions.
