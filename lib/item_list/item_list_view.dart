import 'package:flutter/material.dart' hide SearchBar;
import 'package:get_it/get_it.dart';
import 'package:sample_viewer/api_service.dart';
import 'package:sample_viewer/item_details/item_details_view.dart';
import 'package:sample_viewer/item_list/search_bar.dart';
import 'package:sample_viewer/main.dart';
import 'package:sample_viewer/models/related_topic.dart';

class ItemListView extends StatelessWidget {
  const ItemListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Character List')),
      body: ValueListenableBuilder<List<RelatedTopic>>(
          valueListenable: GetIt.instance.get<ApiService>().filteredTopics,
          builder: (context, topics, _) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SearchBar(),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: topics.length,
                    itemBuilder: (context, index) {
                      RelatedTopic topic = topics[index];

                      return ListTile(
                        title: Text(topic.title),
                        onTap: () {
                          FocusScope.of(context).unfocus();
                          if (MediaQuery.of(context).size.width > largeBreakpoint) {
                            GetIt.instance.get<ApiService>().setSelectedTopic(topic);
                          } else {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ItemDetailsView(topic: topic),
                            ));
                          }
                        },
                      );
                    },
                  ),
                ),
              ],
            );
          }),
    );
  }
}
