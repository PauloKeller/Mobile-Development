# auction_house_app


# Generate built value files

```
flutter packages pub run build_runner build
```

## Internationalization

- Set intl message entry point

```
flutter pub run intl_translation:extract_to_arb --output-dir=lib/src/i18n/ lib/src/i18n/delegate.dart
```

- Build intl message files
```
flutter pub run intl_translation:generate_from_arb --output-dir=lib/src/i18n/ --no-use-deferred-loading lib/src/i18n/delegate.dart lib/src/i18n/intl_*.arb
```
