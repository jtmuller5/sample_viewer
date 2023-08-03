import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:sample_viewer/models/duck_duck_go_result.dart';
import 'package:sample_viewer/models/related_topic.dart';

class ApiService {
  ApiService({bool fetchOnStart = true}) {
    if(fetchOnStart)fetchList();
  }

  ValueNotifier<List<RelatedTopic>> allTopics = ValueNotifier([]);

  void setTopics(List<RelatedTopic> val) {
    allTopics.value = val;
  }

  ValueNotifier<List<RelatedTopic>> filteredTopics = ValueNotifier([]);

  void setFilteredTopics(List<RelatedTopic> val) {
    filteredTopics.value = val;
  }

  ValueNotifier<String?> searchTerm = ValueNotifier(null);

  void setSearchTerm(String? val) {
    searchTerm.value = val;

    if (val != null) {
      filteredTopics.value = allTopics.value.where((element) => (element.text ?? '').toLowerCase().contains(val)).toList();
    }
  }

  ValueNotifier<RelatedTopic?> selectedTopic = ValueNotifier(null);

  void setSelectedTopic(RelatedTopic val) {
    selectedTopic.value = val;
  }

  Future<void> fetchList({String? url}) async {
    String _url = url ?? const String.fromEnvironment('API_URL');
    http.Response response = await GetIt.instance.get<Client>().get(Uri.parse(_url));
    //debugPrint('response: ' + response.body.toString());
    Map<String, dynamic> json = jsonDecode(response.body);
    DuckDuckGoResult result = DuckDuckGoResult.fromJson(json);

    log(result.toJson().toString());
    allTopics.value = result.relatedTopics ?? [];
    filteredTopics.value = allTopics.value;
  }
}
