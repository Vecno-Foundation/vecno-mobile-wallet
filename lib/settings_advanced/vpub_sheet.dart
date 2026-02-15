import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../app_providers.dart';
import '../app_router.dart';
import '../l10n/l10n.dart';
import '../util/ui_util.dart';
import '../widgets/buttons.dart';
import '../widgets/gradient_widgets.dart';
import '../widgets/qr_code_widget.dart';
import '../widgets/sheet_widget.dart';

final vpubProvider = Provider.autoDispose((ref) {
  final wallet = ref.watch(walletProvider);
  final network = ref.watch(networkProvider);

  return wallet.hdPublicKey(network);
});

class VpubSheet extends ConsumerWidget {
  const VpubSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    final styles = ref.watch(stylesProvider);
    final l10n = l10nOf(context);

    final vpub = ref.watch(vpubProvider);

    Future<void> copyVpub() async {
      try {
        await Clipboard.setData(ClipboardData(text: vpub));
        UIUtil.showSnackbar(l10n.vpubCopied, context);
      } catch (_) {
        UIUtil.showSnackbar(l10n.vpubCopyFailed, context);
      }
    }

    return SheetWidget(
      title: l10n.vpubTitle,
      mainWidget: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.115,
                    vertical: 30,
                  ),
                  child: Text(
                    l10n.vpubDescription,
                    style: styles.textStyleAccount,
                    textAlign: TextAlign.center,
                    maxLines: 3,
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                  margin: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.105,
                  ),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: theme.backgroundDarkest,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Text(
                    vpub,
                    style: styles.textStyleAddressText90,
                  ),
                ),
                const SizedBox(height: 40),
                QrCodeWidget(
                  data: vpub,
                  showIcon: false,
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
          const ListTopGradient(),
          const ListBottomGradient(),
        ],
      ),
      bottomWidget: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28),
        child: Column(
          children: [
            PrimaryButton(
              title: l10n.copyVpub,
              onPressed: copyVpub,
            ),
            const SizedBox(height: 16),
            PrimaryOutlineButton(
              title: l10n.close,
              onPressed: () => appRouter.pop(context),
            ),
          ],
        ),
      ),
    );
  }
}
