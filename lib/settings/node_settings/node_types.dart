import 'dart:math';

import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../vecno/vecno.dart';

part 'node_types.freezed.dart';
part 'node_types.g.dart';

const mainnetNodeConfig = NodeConfig(
  id: '7dd403ec-c069-4baa-b1db-b51772f561e0',
  name: 'Vecno Official Node',
  urls: [
    'vecnowallet.vecnoscan.org',
    'vecnowallet2.vecnoscan.org',
  ],
  isSecure: true,
  network: VecnoNetwork.mainnet,
);

@freezed
sealed class NodeConfigSettings with _$NodeConfigSettings {
  const factory NodeConfigSettings({
    @Default(const IListConst([mainnetNodeConfig])) IList<NodeConfig> options,
    @Default(mainnetNodeConfig) NodeConfig selected,
  }) = _NodeConfigSettings;

  factory NodeConfigSettings.fromJson(Map<String, dynamic> json) =>
      _$NodeConfigSettingsFromJson(json);
}

@freezed
sealed class NodeConfig with _$NodeConfig {
  const NodeConfig._();

  const factory NodeConfig({
    required String id,
    required String name,
    @Default(false) bool isDns,
    @Default(false) bool isSecure,
    required List<String> urls,
    required VecnoNetwork network,
  }) = _NodeConfig;

  String get networkId => network.name;

  factory NodeConfig.fromJson(Map<String, dynamic> json) =>
      _$NodeConfigFromJson(json);
}

@freezed
sealed class ActiveNodeConfig with _$ActiveNodeConfig {
  ActiveNodeConfig._();

  factory ActiveNodeConfig({
    required NodeConfig config,
  }) = _ActiveNodeConfig;

  String get name => config.name;
  VecnoNetwork get network => config.network;

  bool get isSecure => config.isSecure;

  late final String url =
      config.urls[Random().nextInt(config.urls.length)];

  late final String networkId = config.networkId;
}

@freezed
sealed class AddNodeSheetState with _$AddNodeSheetState {
  const factory AddNodeSheetState({
    @Default(true) bool showNameHint,
    @Default(true) bool showUrlHint,
    @Default('') String nameValidationText,
    @Default('') String urlValidationText,
  }) = _AddNodeSheetState;
}