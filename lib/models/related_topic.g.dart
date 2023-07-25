// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'related_topic.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RelatedTopic _$RelatedTopicFromJson(Map<String, dynamic> json) => RelatedTopic(
      json['FirstURL'] as String?,
      json['Icon'] == null
          ? null
          : ResultIcon.fromJson(json['Icon'] as Map<String, dynamic>),
      json['Result'] as String?,
      json['Text'] as String?,
    );

Map<String, dynamic> _$RelatedTopicToJson(RelatedTopic instance) =>
    <String, dynamic>{
      'FirstURL': instance.firstUrl,
      'Icon': instance.icon?.toJson(),
      'Result': instance.result,
      'Text': instance.text,
    };

ResultIcon _$ResultIconFromJson(Map<String, dynamic> json) => ResultIcon(
      json['height'] as String?,
      json['URL'] as String?,
      json['width'] as String?,
    );

Map<String, dynamic> _$ResultIconToJson(ResultIcon instance) =>
    <String, dynamic>{
      'height': instance.height,
      'URL': instance.url,
      'width': instance.width,
    };
