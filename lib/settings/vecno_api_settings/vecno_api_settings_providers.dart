import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/core_providers.dart';
import '../settings_providers.dart';
import 'vecno_api_settings_notifier.dart';
import 'vecno_api_settings_types.dart';

final vecnoApiSettingsProvider =
    StateNotifierProvider<VecnoApiSettingsNotifier, VecnoApiSettings>((ref) {
  final repository = ref.watch(settingsRepositoryProvider);
  return VecnoApiSettingsNotifier(repository);
});

final vecnoApiDefaultUrlProvider = Provider.autoDispose((ref) {
  final networkId = ref.watch(networkIdProvider);

  final apiUrl = VecnoApiSettings.defaultApiUrlForNetworkId(networkId);

  return apiUrl;
});

final vecnoApiUrlProvider = Provider.autoDispose((ref) {
  final settings = ref.watch(vecnoApiSettingsProvider);
  final networkId = ref.watch(networkIdProvider);

  final apiUrl = settings.apiUrlForNetworkId(networkId);

  return apiUrl;
});

final vecnoApiUserSetUrlProvider = Provider.autoDispose((ref) {
  final defaultApiUrl = ref.watch(vecnoApiDefaultUrlProvider);
  final apiUrl = ref.watch(vecnoApiUrlProvider);

  return apiUrl == defaultApiUrl ? '' : apiUrl;
});
