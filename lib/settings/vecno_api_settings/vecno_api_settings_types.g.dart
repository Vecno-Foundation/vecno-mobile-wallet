// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vecno_api_settings_types.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_VecnoApiSettings _$VecnoApiSettingsFromJson(Map json) => _VecnoApiSettings(
  apiUrlByNetworkId:
      (json['apiUrlByNetworkId'] as Map?)?.map(
        (k, e) => MapEntry(k as String, e as String),
      ) ??
      const {},
);

Map<String, dynamic> _$VecnoApiSettingsToJson(_VecnoApiSettings instance) =>
    <String, dynamic>{'apiUrlByNetworkId': instance.apiUrlByNetworkId};
