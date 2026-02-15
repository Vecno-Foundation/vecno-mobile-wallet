import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../app_providers.dart';
import '../l10n/l10n.dart';
import 'intro_actions_widget.dart';
import 'intro_language_selector.dart';

class IntroWelcome extends ConsumerWidget {
  const IntroWelcome({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final styles = ref.watch(stylesProvider);
    final theme = ref.watch(themeProvider);
    final l10n = l10nOf(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: theme.backgroundDark,
      body: SafeArea(
        minimum: EdgeInsets.only(
          bottom: MediaQuery.of(context).size.height * 0.035,
          top: MediaQuery.of(context).size.height * 0.10,
        ),
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 4,
                    child: FractionallySizedBox(
                      widthFactor: 0.42,
                      child: FittedBox(
                        fit: BoxFit.contain,
                        child: Image.asset('assets/vecno.png'),
                      ),
                    ),
                  ),
                  const IntroLanguageSelector(),
                  Expanded(
                    flex: 5,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 36),
                      child: AutoSizeText(
                        l10n.welcomeText,
                        style: styles.textStyleParagraph,
                        minFontSize: 17,
                        maxLines: 5,
                        stepGranularity: 0.5,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
            const IntroActionsWidget(),
          ],
        ),
      ),
    );
  }
}