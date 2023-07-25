import 'package:json_annotation/json_annotation.dart';
import 'package:sample_viewer/models/related_topic.dart';

part 'duck_duck_go_result.g.dart';

@JsonSerializable(explicitToJson: true)
class DuckDuckGoResult {
  @JsonKey(name: 'RelatedTopics')
  List<RelatedTopic>? relatedTopics;

  DuckDuckGoResult(this.relatedTopics);

  factory DuckDuckGoResult.fromJson(Map<String, dynamic> json) => _$DuckDuckGoResultFromJson(json);

  Map<String, dynamic> toJson() => _$DuckDuckGoResultToJson(this);
}
