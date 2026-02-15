import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../app_providers.dart';
import '../../app_styles.dart';
import '../../l10n/l10n.dart';
import '../../widgets/dialog.dart';
import 'node_types.dart';

final vecnoNodeConfigItemProvider =
    Provider<ActiveNodeConfig>((ref) => throw UnimplementedError);

class NodeItem extends ConsumerWidget {
  const NodeItem({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    final styles = ref.watch(stylesProvider);
    final l10n = l10nOf(context);

    final item = ref.watch(vecnoNodeConfigItemProvider);
    final activeConfig = ref.watch(vecnoNodeConfigProvider);

    Future<void> change() async {
      final oldNetworkId = ref.read(networkIdProvider);
      final newNetworkId = item.networkId;
      final repository = ref.read(walletRepositoryProvider);
      final wallet = ref.read(walletProvider);
      if (oldNetworkId != newNetworkId) {
        await repository.openWalletBoxes(wallet, networkId: newNetworkId);
      }

      final notifier = ref.read(vecnoNodeSettingsProvider.notifier);
      await notifier.updateSelected(item.config);

      if (oldNetworkId != newNetworkId) {
        await repository.closeWalletBoxes(wallet, networkId: oldNetworkId);
      }
    }

    void delete() {
      final notifier = ref.read(vecnoNodeSettingsProvider.notifier);
      notifier.removeOption(item.config);
    }

    void confirmDelete() {
      final title = l10n.nodeDeleteTitle;
      final content = '${l10n.nodeDeleteMessage} ${item.name}?';
      AppDialogs.showConfirmDialog(
        context,
        title,
        content,
        l10n.yesUppercase,
        delete,
        cancelText: l10n.noUppercase,
      );
    }

    return Slidable(
      enabled: item != activeConfig,
      endActionPane: ActionPane(
        extentRatio: 0.16,
        motion: const StretchMotion(),
        children: [
          SlidableAction(
            icon: Icons.delete,
            backgroundColor: theme.primary,
            foregroundColor: theme.backgroundDark,
            onPressed: (_) => confirmDelete(),
          ),
        ],
      ),
      child: Column(
        children: [
          Divider(height: 2, color: theme.text15),
          TextButton(
            style: styles.defaultTextButtonStyle,
            onPressed: change, // Keep this for tapping the whole row
            child: Container(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Wrap the Radio in RadioGroup
                  RadioGroup<ActiveNodeConfig>(
                    groupValue: activeConfig,
                    onChanged: (ActiveNodeConfig? newValue) {
                      if (newValue != null && newValue != activeConfig) {
                        change(); // Trigger your async logic
                      }
                    },
                    child: Radio<ActiveNodeConfig>(
                      value: item,
                      activeColor: theme.primary,
                      // No groupValue or onChanged here anymore
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                item.name,
                                style: styles.textStyleSettingItemHeader,
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 4, right: 4),
                              padding: const EdgeInsetsDirectional.fromSTEB(6, 2, 6, 2),
                              decoration: BoxDecoration(
                                color: theme.text10,
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Text(
                                item.networkId.toUpperCase(),
                                style: styles.tagText.copyWith(fontSize: 10),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 3),
                              child: Text(
                                item.url.toString(),
                                style: styles.textStyleAddressText60.copyWith(
                                  fontSize: AppFontSizes.smallest,
                                  height: 1.2,
                                ),
                              ),
                            ),
                            const SizedBox(width: 4),
                            if (item.isSecure)
                              Tooltip(
                                message: l10n.nodeSecureConnection,
                                child: Icon(Icons.lock,
                                    size: 12, color: theme.text60),
                              )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}