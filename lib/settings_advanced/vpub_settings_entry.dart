import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/core_providers.dart';
import '../l10n/l10n.dart';
import '../settings_drawer/double_line_item_two.dart';
import '../widgets/sheet_util.dart';
import 'vpub_sheet.dart';

class VpubSettingsEntry extends ConsumerWidget {
  const VpubSettingsEntry({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = l10nOf(context);

    Future<void> showVpub() async {
      final theme = ref.read(themeProvider);
      final authUtil = ref.read(authUtilProvider);
      final message = l10n.vpubAuth;
      final auth = await authUtil.authenticate(context, message, message);

      if (!auth) {
        return;
      }

      return Sheets.showAppHeightNineSheet(
        context: context,
        widget: const VpubSheet(),
        theme: theme,
      );
    }

    return DoubleLineItemTwo(
      heading: l10n.vpubTitle,
      text: l10n.vpubAuth,
      icon: Icons.vpn_key,
      iconSize: 28,
      onPressed: showVpub,
    );
  }
}
