# sample_viewer
Sample repo for fetching internet data

# App Variants
This app uses --dart-define-from-file to allow multiple apps to be built from the same codebase. The following variants are available:

- simpsons
- wire

If you open this codebase in Android Studio, the run configurations will be auto-populated. Otherwise you can run each variant using the following commands:
```shell
flutter run --dart-define-from-file=assets/simpsons.json
```

```shell
flutter run --dart-define-from-file=assets/wire.json
```

Each variant has a unique bundle ID, name, and search URL.

# Features
##  Responsive Design
On large screens the app will display as a list next to a details component while on small screens the list and details pages are separate.

## Search
The search bar will filter the search results based on the contents of the item's "text" field which includes their name and description.

# Architecture
I used the get_it package, ValueNotifiers, and ValueNotifierBuilders to manage and react to app state. To deserialize the json results I used the json_serializable and json_annotation packages.