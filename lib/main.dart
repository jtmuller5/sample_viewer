import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:sample_viewer/item_details/item_details_view.dart';
import 'package:sample_viewer/item_list/item_list_view.dart';

import 'api_service.dart';

final getIt = GetIt.instance;

double largeBreakpoint = 600;

void main() {

  getIt.registerSingleton<ApiService>(ApiService());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < largeBreakpoint) {
            return const ItemListView();
          } else {
            return Row(
              children: [
                SizedBox(
                    width: 300,
                    child: ItemListView()),
                Expanded(
                  child: ValueListenableBuilder(
                    valueListenable: GetIt.instance.get<ApiService>().selectedTopic,
                    builder: (context, topic, _) {
                      return ItemDetailsView(topic: topic);
                    }
                  ),
                )
              ],
            );
          }
        },
      )
    );
  }
}