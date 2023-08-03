import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sample_viewer/api_service.dart';

import 'test_data.dart';

ApiService get service => GetIt.instance.get<ApiService>();

class MockClient extends Mock implements Client {}

Future<Client> getAndRegisterClientMock({bool fail = false}) async {
  await _removeRegistrationIfExists<Client>();

  final MockClient service = MockClient();

  GetIt.instance.registerSingleton<Client>(service);

  return service;
}

Future<void> _removeRegistrationIfExists<T extends Object>() async {
  if (GetIt.instance.isRegistered<T>()) {
    await GetIt.instance.unregister<T>();
  }
}

void main() {
  group('ApiService -', () {

    setUp(() async {
      await getAndRegisterClientMock();
      GetIt.instance.registerSingleton(ApiService(fetchOnStart: false));

      when(() => GetIt.instance.get<Client>().get(Uri.parse(testUrl))).thenAnswer(
        (realInvocation) async => Response(testResponse, 200),
      );
    });

    test('Search results from the Http request are added to the ApiService', () async {
      // Setup - Arrange
      var model = service;

      // Action - Act
      await model.fetchList(url: testUrl);

      // Result - Assert
      expect(model.allTopics.value.length, 5);
    });

    test('When the search term is updated, the filtered topics list is updated', () async {
      // Setup - Arrange
      var model = service;

      // Action - Act
      await model.fetchList(url: testUrl);
      model.setSearchTerm('apu');

      // Result - Assert
      expect(model.searchTerm.value, 'apu');
      expect(model.filteredTopics.value.length, 2);
    });
  });
}
