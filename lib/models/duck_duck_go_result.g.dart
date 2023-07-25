// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'duck_duck_go_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DuckDuckGoResult _$DuckDuckGoResultFromJson(Map<String, dynamic> json) =>
    DuckDuckGoResult(
      (json['RelatedTopics'] as List<dynamic>?)
          ?.map((e) => RelatedTopic.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DuckDuckGoResultToJson(DuckDuckGoResult instance) =>
    <String, dynamic>{
      'RelatedTopics': instance.relatedTopics?.map((e) => e.toJson()).toList(),
    };
