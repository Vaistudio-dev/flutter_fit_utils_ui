/// Interface for an object that can be evaluated by a [FitRuleValidator].
mixin RuleValidator {
  /// Checks each rules and returns it's validation state along side of the rule itself.
  Map<String, bool> validate();

  /// Returns [true] if all the rules are valid.
  bool isAllValid() => !validate().values.any((element) => !element);
}