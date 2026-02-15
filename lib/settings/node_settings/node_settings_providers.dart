import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../settings_providers.dart';
import 'node_settings_notifier.dart';
import 'node_types.dart';

final vecnoNodeSettingsProvider =
    StateNotifierProvider<NodeSettingsNotifier, NodeConfigSettings>((ref) {
  final repository = ref.watch(settingsRepositoryProvider);
  final notifier = NodeSettingsNotifier(repository);
  return notifier;
});

final vecnoNodeOptionsProvider = Provider((ref) {
  final settings = ref.watch(vecnoNodeSettingsProvider);
  return settings.options;
});

final vecnoNodeConfigProvider = Provider((ref) {
  final settings = ref.watch(vecnoNodeSettingsProvider);
  return ActiveNodeConfig(config: settings.selected);
});
