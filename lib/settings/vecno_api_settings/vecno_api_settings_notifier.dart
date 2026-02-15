import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../settings_repository.dart';
import 'vecno_api_settings_types.dart';

const kVecnoApiSettingsKey = '_kVecnoApiSettingsKey';

extension VecnoApiSettingsExtension on SettingsRepository {
  VecnoApiSettings getVecnoApiSettings() {
    return box.tryGet<VecnoApiSettings>(kVecnoApiSettingsKey,
            typeFactory: VecnoApiSettings.fromJson) ??
        const VecnoApiSettings();
  }

  Future<void> setVecnoApiSettings(VecnoApiSettings settings) {
    return box.set(kVecnoApiSettingsKey, settings);
  }
}

class VecnoApiSettingsNotifier extends StateNotifier<VecnoApiSettings> {
  final SettingsRepository repository;
  VecnoApiSettingsNotifier(this.repository)
      : super(repository.getVecnoApiSettings());

  Future<void> setApiUrl(
    String apiUrl, {
    required String networkId,
  }) async {
    if (state.apiUrlForNetworkId(networkId) == apiUrl) {
      return;
    }

    final apiUrlByNetworkId = {
      ...state.apiUrlByNetworkId,
      networkId: apiUrl,
    };

    if (apiUrl.isEmpty) {
      apiUrlByNetworkId.remove(networkId);
    }

    final settings = state.copyWith(apiUrlByNetworkId: apiUrlByNetworkId);

    await repository.setVecnoApiSettings(settings);
    state = settings;
  }
}
