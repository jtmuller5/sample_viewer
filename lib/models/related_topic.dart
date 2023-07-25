import 'package:json_annotation/json_annotation.dart';

part 'related_topic.g.dart';

@JsonSerializable(explicitToJson: true)
class RelatedTopic {
  @JsonKey(name: 'FirstURL')
  final String? firstUrl;

  @JsonKey(name: 'Icon')
  final ResultIcon? icon;

  @JsonKey(name: 'Result')
  final String? result;

  @JsonKey(name: 'Text')
  final String? text;

  String get title => text.toString().split(' - ')[0];

  String get imageUrl => icon?.url == null ? '' : 'https://duckduckgo.com/' +  icon!.url.toString();

  RelatedTopic(this.firstUrl, this.icon, this.result, this.text);

  factory RelatedTopic.fromJson(Map<String, dynamic> json) => _$RelatedTopicFromJson(json);

  Map<String, dynamic> toJson() => _$RelatedTopicToJson(this);
}

@JsonSerializable()
class ResultIcon {
  final String? height;

  @JsonKey(name: 'URL')
  final String? url;

  final String? width;

  ResultIcon(
    this.height,
    this.url,
    this.width,
  );

  factory ResultIcon.fromJson(Map<String, dynamic> json) => _$ResultIconFromJson(json);

  Map<String, dynamic> toJson() => _$ResultIconToJson(this);
}
