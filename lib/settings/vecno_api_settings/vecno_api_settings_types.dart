import 'package:freezed_annotation/freezed_annotation.dart';

import '../../vecno/network.dart';

part 'vecno_api_settings_types.freezed.dart';
part 'vecno_api_settings_types.g.dart';

const kVecnoApiUrlMainnet = 'https://api.vecnoscan.org';
const kVecnoApiUrlTestnet = 'https://testnetapi.vecnoscan.org';

@freezed
sealed class VecnoApiSettings with _$VecnoApiSettings {
  const VecnoApiSettings._();

  const factory VecnoApiSettings({
    @Default({}) Map<String, String> apiUrlByNetworkId,
  }) = _VecnoApiSettings;

  factory VecnoApiSettings.fromJson(Map<String, dynamic> json) =>
      _$VecnoApiSettingsFromJson(json);

  static String defaultApiUrlForNetworkId(String networkId) {
    return switch (networkId) {
      kVecnoNetworkIdMainnet => kVecnoApiUrlMainnet,
      kVecnoNetworkIdTestnet => kVecnoApiUrlTestnet,
      _ => '',
    };
  }

  String apiUrlForNetworkId(String networkId) {
    return apiUrlByNetworkId[networkId] ?? defaultApiUrlForNetworkId(networkId);
  }
}
