import 'package:flutter/material.dart' hide SearchBar;
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sample_viewer/api_service.dart';
import 'package:sample_viewer/item_details/character_image.dart';
import 'package:sample_viewer/item_details/item_details_view.dart';
import 'package:sample_viewer/item_list/item_list_view.dart';
import 'package:sample_viewer/item_list/search_bar.dart';

import 'package:sample_viewer/main.dart';

import 'test_data.dart';
import 'unit_tests.dart';

// Necessary because Scaffolds require MediaQuery ancestor widget (MaterialApp)
/// https://stackoverflow.com/questions/48498709/widget-test-fails-with-no-mediaquery-widget-found
class TestingWrapper extends StatelessWidget {
  const TestingWrapper(
    this.child, {
    super.key,
    this.width = 1080,
  });

  final Widget child;
  final double width;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // localizationsDelegates: const [AppLocalizations.delegate],
      locale: const Locale('en'),
      home: mediaWidget(),
    );
  }

  Widget mediaWidget() {
    return MediaQuery(
      data: MediaQueryData(size: Size(width, 2160)),
      child: Material(child: child),
    );
  }
}

void main() {

  testWidgets('Character Details page', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(TestingWrapper(ItemDetailsView(topic: testCharacter)));

    // Verify that the character name and description are shown.
    expect(find.text('Test Character'), findsOneWidget);
    expect(find.textContaining('Character description'), findsOneWidget);
    expect(find.byType(CharacterImage), findsOneWidget);
  });

  group('Character list page', () {
    setUp(() async {
      await getAndRegisterClientMock();
      GetIt.instance.registerSingleton(ApiService(fetchOnStart: false));
      when(() => GetIt.instance.get<Client>().get(Uri.parse(testUrl))).thenAnswer(
            (realInvocation) async => Response(testResponse, 200),
      );
    });

    testWidgets('Typing in the search bar updates the search term in the ApiService', (tester) async {
      await tester.pumpWidget(TestingWrapper(SearchBar()));

      Finder searchBar = find.byType(TextField);
      await tester.enterText(searchBar, 'apu');

      expect(GetIt.instance.get<ApiService>().searchTerm.value, 'apu');
    });

    testWidgets('All characters are shown on list page', (WidgetTester tester) async {
      await tester.pumpWidget(const TestingWrapper(ItemListView()));

      await GetIt.instance.get<ApiService>().fetchList(url: testUrl);

      await tester.pumpAndSettle();

      // Finders
      final characterTile = find.byType(ListTile);

      expect(characterTile, findsNWidgets(5));
    });
  });

}
