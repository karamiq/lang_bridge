import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lang_bridge/common_lib.dart';
import 'package:lang_bridge/components/gardient_text.dart';
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
    final colorScheme = context.colorScheme;

    return Container(
      height: preferredSize.height,
      alignment: Alignment.bottomCenter,
      decoration: BoxDecoration(
        color: colorScheme.primary,
        // borderRadius: BorderRadius.only(
        //   bottomLeft: Radius.circular(Insets.medium),
        //   bottomRight: Radius.circular(Insets.medium),
        // ),
        //   border: Border(bottom: BorderSide(color: colorScheme.onPrimary.withOpacity(0.2), width: 1.0)),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: Insets.medium,
        vertical: Insets.large,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: colorScheme.primaryContainer,
              borderRadius: BorderSize.extraSmallRadius,
              border: Border.all(
                color: colorScheme.onPrimary.withOpacity(0.1),
                width: 1,
              ),
            ),
            child: Center(
              child: Text(
                'L',
                style: TextStyle(
                  color: colorScheme.onPrimaryContainer,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              GradientText(
                context.l10n.appName,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: colorScheme.onPrimary),
                gradient: AppColors.primaryGradient,
              ),
              Text(
                ref.read(settingsProvider).locale?.languageCode == 'ar' ? 'AR → EN' : 'EN → AR',
                style: TextStyle(
                  fontSize: 14,
                  color: colorScheme.onPrimary.withOpacity(0.8),
                ),
              ),
            ],
          ),
          const Spacer(),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              AppBarIcon(
                icon: Assets.assetsSvgStar,
                color: AppColors.stars,
                label: '5,365',
                onPressed: () async {
                  for (var i = 0; i < 100; i++) {
                    final random = Random();

                    int randomPoints = 3000 + random.nextInt(201); // 201 because nextInt is exclusive

                    FirebaseFirestore.instance.collection('users').doc(i.toString()).set({
                      'fullName': 'User $i',
                      'email': "tester$i@gmail.com",
                      'createdAt': DateTime.now().toIso8601String(),
                      'streak': 0,
                      'points': randomPoints,
                      'uid': i.toString(),
                      'password': 'password$i',
                    });
                  }
                },
              ),
              const SizedBox(width: Insets.small),
              AppBarIcon(
                icon: Assets.assetsSvgCup,
                color: AppColors.achivement,
                onPressed: () {},
              ),
              const SizedBox(width: Insets.small),
            ],
          ),
        ],
      ),
    );
  }
}
