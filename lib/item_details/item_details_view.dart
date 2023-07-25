import 'package:flutter/material.dart';
import 'package:sample_viewer/item_details/character_image.dart';
import 'package:sample_viewer/models/related_topic.dart';

class ItemDetailsView extends StatelessWidget {
  const ItemDetailsView({Key? key, required this.topic}) : super(key: key);

  final RelatedTopic? topic;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: topic == null ? Center(
        child: Text('Select a Character'),
      ): CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: true,
            title: Text(topic?.title ?? ''),
          ),
          SliverToBoxAdapter(
            child: CharacterImage(
                key: ValueKey(topic?.imageUrl ?? ''),
                imageUrl: topic?.imageUrl ?? ''),
          ),
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Divider(),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                topic?.text ?? '',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
          )
        ],
      ),
    );
  }
}
