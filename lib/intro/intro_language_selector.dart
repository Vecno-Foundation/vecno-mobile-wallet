import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../app_providers.dart';
import '../settings/available_language.dart';
import '../settings_drawer/language_dialog.dart';
import '../widgets/app_simpledialog.dart';

class IntroLanguageSelector extends ConsumerWidget {
  const IntroLanguageSelector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentLangSetting = ref.watch(languageProvider);
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () async {
          final selected = await showAppDialog<AvailableLanguage>(
            context: context,
            builder: (context) => const LanguageDialog(),
          );

          if (selected != null && context.mounted) {
            ref.read(languageProvider.notifier).updateLanguage(
              LanguageSetting(selected),
            );
          }
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          decoration: BoxDecoration(
            border: Border.all(
              color: theme.dividerColor.withValues(alpha: 0.4),
              width: 1.5,
            ),
            borderRadius: BorderRadius.circular(16),
            color: theme.cardColor.withValues(alpha: 0.08),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.translate_rounded,
                size: 20,
                color: Colors.white.withValues(alpha: 0.9),
              ),
              const SizedBox(width: 10),
              Text(
                currentLangSetting.getDisplayName(context),
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 6),
              Icon(
                Icons.arrow_drop_down_rounded,
                size: 22,
                color: Colors.white.withValues(alpha: 0.75),
              ),
            ],
          ),
        ),
      ),
    );
  }
}