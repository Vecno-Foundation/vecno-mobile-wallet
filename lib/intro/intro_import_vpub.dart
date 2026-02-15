import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../app_icons.dart';
import '../app_providers.dart';
import '../vecno/vecno.dart';
import '../l10n/l10n.dart';
import '../util/ui_util.dart';
import '../util/user_data_util.dart';
import '../widgets/app_text_field.dart';
import '../widgets/buttons.dart';
import 'intro_back_button.dart';
import 'intro_providers.dart';

bool isValidVpub(String vpub) {
  try {
    final _ = HdWalletViewSchnorr(convertIfXpub(vpub));
    return true;
  } catch (_) {
    return false;
  }
}

class IntroImportVpub extends HookConsumerWidget {
  const IntroImportVpub({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    final styles = ref.watch(stylesProvider);
    final l10n = l10nOf(context);

    final vpubFocusNode = useFocusNode();
    final vpubController = useTextEditingController();

    final update = useValueListenable(vpubController);

    final vpubIsValid = useMemoized(
      () => isValidVpub(update.text),
      [update],
    );

    final showInvalidMessage = update.text.isNotEmpty && !vpubIsValid;

    Future<void> scanQrCode() async {
      if (vpubIsValid) {
        return;
      }
      final result = await UserDataUtil.scanQrCode(context);
      final code = result?.code;
      if (code == null) {
        return;
      }
      final vpub = code.trim();
      if (isValidVpub(vpub)) {
        vpubController.text = vpub;
        return;
      }
      UIUtil.showSnackbar(l10n.importVpubQrCodeError, context);
    }

    Future<void> pasteFromClipboard() async {
      if (vpubIsValid) {
        return;
      }

      final data = await Clipboard.getData(Clipboard.kTextPlain);
      if (data == null || data.text == null) {
        UIUtil.showSnackbar(l10n.clipboardEmpty, context);
        return;
      }
      final text = data.text!.trim();
      if (isValidVpub(text)) {
        vpubController.text = text;
        return;
      }
      UIUtil.showSnackbar(l10n.importVpubClipboardError, context);
    }

    void submitVpub() {
      final vpub = convertIfXpub(vpubController.text.trim());
      final intro = ref.read(introStateProvider.notifier);

      if (isValidVpub(vpub)) {
        intro.setVpub(vpub);
      }
    }

    return Scaffold(
      backgroundColor: theme.backgroundDark,
      body: SafeArea(
        minimum: EdgeInsets.only(
          bottom: MediaQuery.of(context).size.height * 0.035,
          top: MediaQuery.of(context).size.height * 0.075,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: ListView(
                shrinkWrap: true,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsetsDirectional.only(start: 20),
                      child: const IntroBackButton(),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 40, right: 40, top: 10),
                    alignment: AlignmentDirectional(-1, 0),
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        l10n.importVpub,
                        style: styles.textStyleHeaderColored,
                        maxLines: 1,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 40, right: 40, top: 15),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      l10n.importVpubHint,
                      style: styles.textStyleParagraph,
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Column(children: [
                    AppTextField(
                      leftMargin: 40,
                      rightMargin: 40,
                      topMargin: 20,
                      focusNode: vpubFocusNode,
                      controller: vpubController,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(128),
                        FilteringTextInputFormatter.allow(
                          RegExp("[a-km-zA-HJ-NP-Z1-9]"),
                        ),
                      ],
                      textInputAction: TextInputAction.next,
                      maxLines: null,
                      autocorrect: false,
                      autofocus: true,
                      prefixButton: TextFieldButton(
                        icon: AppIcons.scan,
                        onPressed: scanQrCode,
                      ),
                      fadePrefixOnCondition: true,
                      prefixShowFirstCondition: !vpubIsValid,
                      suffixButton: TextFieldButton(
                        icon: AppIcons.paste,
                        onPressed: pasteFromClipboard,
                      ),
                      fadeSuffixOnCondition: true,
                      suffixShowFirstCondition: !vpubIsValid,
                      keyboardType: TextInputType.text,
                      style: vpubIsValid
                          ? styles.textStyleParagraphPrimaryNormal
                          : styles.textStyleParagraphNormal,
                    ),
                    Container(
                      alignment: const AlignmentDirectional(0, 0),
                      padding: const EdgeInsets.symmetric(
                        vertical: 6,
                        horizontal: 40,
                      ),
                      child: Text(
                        showInvalidMessage ? l10n.invalidVpubMessage : '',
                        style: styles.textStyleParagraphThinSuccess,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ]),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: Column(children: [
                PrimaryButton(
                  title: l10n.nextButton,
                  onPressed: submitVpub,
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
