import 'package:flutter/material.dart';
import 'package:lang_bridge/common_lib.dart';
import 'package:lang_bridge/data/providers/authentication_provider.dart';
import 'package:lang_bridge/data/providers/settings_provider.dart';
import 'package:lang_bridge/src/entry_point/components/app_bar_icon.dart';

class CustomAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Size get preferredSize => const Size.fromHeight(130);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userPoints = ref.watch(authenticationProvider)!.points;
    final colorScheme = context.colorScheme;

    return Container(
      height: preferredSize.height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            colorScheme.primary,
            colorScheme.primary.withOpacity(0.95),
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: colorScheme.shadow.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Container(
        padding: Insets.smallAll,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        colorScheme.primaryContainer,
                        colorScheme.primaryContainer.withOpacity(0.8),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: colorScheme.outline.withOpacity(0.2),
                      width: 1,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: colorScheme.shadow.withOpacity(0.15),
                        blurRadius: 6,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      'L',
                      style: TextStyle(
                        color: colorScheme.onPrimaryContainer,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        letterSpacing: -0.5,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        context.l10n.appName,
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: colorScheme.onPrimary,
                          letterSpacing: -0.5,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: colorScheme.onPrimary.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: colorScheme.onPrimary.withOpacity(0.2),
                            width: 0.5,
                          ),
                        ),
                        child: Text(
                          ref.read(settingsProvider).locale.languageCode == 'ar' ? 'AR → EN' : 'EN → AR',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: colorScheme.onPrimary.withOpacity(0.9),
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Action Icons

                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AppBarIcon(
                      icon: Assets.assetsSvgStar,
                      color: AppColors.stars,
                      label: userPoints.toString(),
                      onPressed: () async {
                        // for (var i = 0; i < 100; i++) {
                        //   final random = Random();

                        //   int randomPoints = 3000 + random.nextInt(201); // 201 because nextInt is exclusive

                        //   FirebaseFirestore.instance.collection('users').doc(i.toString()).set({
                        //     'fullName': 'User $i',
                        //     'email': "tester$i@gmail.com",
                        //     'createdAt': DateTime.now().toIso8601String(),
                        //     'streak': 0,
                        //     'points': randomPoints,
                        //     'uid': i.toString(),
                        //     'password': 'password$i',
                        //   });
                        // }
                      },
                    ),
                    const SizedBox(width: Insets.small),
                    AppBarIcon(
                      icon: Assets.assetsSvgCup,
                      color: AppColors.achivement,
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
