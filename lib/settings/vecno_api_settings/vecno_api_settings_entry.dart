import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/core_providers.dart';
import '../../settings_drawer/double_line_item.dart';
import '../../widgets/sheet_util.dart';
import '../setting_item.dart';
import 'vecno_api_settings_providers.dart';
import 'vecno_api_settings_sheet.dart';

class VecnoApiSettingsUrlEntry extends ConsumerWidget {
  const VecnoApiSettingsUrlEntry({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vecnoApiUrl = ref.watch(vecnoApiUrlProvider);

    void _changeVecnoApiUrl() {
      final theme = ref.read(themeProvider);
      Sheets.showAppHeightEightSheet(
        context: context,
        theme: theme,
        widget: const VecnoApiSettingsSheet(),
      );
    }

    return DoubleLineItem(
      heading: 'Vecno API',
      defaultMethod: StringSelectionItem(
        vecnoApiUrl.substring(vecnoApiUrl.indexOf('://') + 3),
      ),
      icon: Icons.api,
      onPressed: _changeVecnoApiUrl,
    );
  }
}
