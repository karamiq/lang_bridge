import 'package:flutter/services.dart';
import 'package:lang_bridge/common_lib.dart';
import 'package:flutter/material.dart';
import 'package:lang_bridge/src/entry_point/components/custom_app_bar.dart';

/// A beautiful entry point widget that provides elegant navigation
/// throughout the language learning journey
class EntryPoint extends StatefulHookConsumerWidget {
  const EntryPoint({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _EntryPointState();
}

class _EntryPointState extends ConsumerState<EntryPoint> with TickerProviderStateMixin {
  /// Navigation destinations for the learning journey
  List<String> get _navigationPages => [
        RoutesDocument.learnWords,
        RoutesDocument.dailyPhrases,
        RoutesDocument.activities,
        RoutesDocument.leaderboard,
        RoutesDocument.profile,
      ];

  /// Determines the currently selected navigation index
  int _getCurrentNavigationIndex() {
    final currentPath = GoRouterState.of(context).fullPath;
    if (currentPath == null) return 0;

    final index = _navigationPages.indexOf(currentPath);
    return index != -1 ? index : 0;
  }

  /// Handles elegant navigation between sections
  void _navigateToSection(int index) {
    if (index >= 0 && index < _navigationPages.length) {
      // Add a subtle haptic feedback for delightful interaction
      HapticFeedback.lightImpact();

      GoRouter.of(context).go(_navigationPages[index]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: _buildBottomNavigationBar(),
      appBar: const CustomAppBar(),
    );
  }

  Widget _buildBottomNavigationBar() {
    return ClipRRect(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(Insets.medium),
      ),
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        backgroundColor: context.colorScheme.primary,
        selectedLabelStyle: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: context.colorScheme.onPrimary,
        ),
        unselectedLabelStyle: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w500,
          color: context.colorScheme.onPrimary.withOpacity(0.7),
        ),
        currentIndex: _getCurrentNavigationIndex(),
        onTap: _navigateToSection,
        selectedItemColor: context.colorScheme.onPrimary,
        unselectedItemColor: context.colorScheme.onPrimary.withOpacity(0.7),
        items: _buildNavigationItems(),
      ),
    );
  }

  List<BottomNavigationBarItem> _buildNavigationItems() {
    final navigationData = [
      _NavigationItem(
        icon: Assets.assetsSvgClosedBook,
        label: context.l10n.learn,
      ),
      _NavigationItem(
        icon: Assets.assetsSvgCalendar,
        label: context.l10n.daily,
      ),
      _NavigationItem(
        icon: Assets.assetsSvgBook,
        label: context.l10n.activities,
      ),
      _NavigationItem(
        icon: Assets.assetsSvgLeaderboard,
        label: context.l10n.leaderboard,
      ),
      _NavigationItem(
        icon: Assets.assetsSvgProfile,
        label: context.l10n.profile,
      ),
    ];

    return navigationData.map((item) => _createNavigationBarItem(item)).toList();
  }

  BottomNavigationBarItem _createNavigationBarItem(_NavigationItem item) {
    return BottomNavigationBarItem(
      activeIcon: _buildIcon(
        iconPath: item.icon,
        isActive: true,
      ),
      icon: _buildIcon(
        iconPath: item.icon,
        isActive: false,
      ),
      label: item.label,
    );
  }

  Widget _buildIcon({
    required String iconPath,
    required bool isActive,
  }) {
    return Container(
      padding: EdgeInsets.all(isActive ? Insets.medium : Insets.small),
      decoration: isActive
          ? BoxDecoration(
              color: context.colorScheme.onPrimary.withOpacity(0.2),
              borderRadius: BorderRadius.circular(12),
            )
          : null,
      child: SvgPicture.asset(
        iconPath,
        width: isActive ? 24 : 22,
        height: isActive ? 24 : 22,
        fit: BoxFit.contain,
        colorFilter: ColorFilter.mode(
          isActive ? context.colorScheme.onPrimary : context.colorScheme.onPrimary.withOpacity(0.7),
          BlendMode.srcIn,
        ),
      ),
    );
  }
}

class _NavigationItem {
  const _NavigationItem({
    required this.icon,
    required this.label,
  });

  final String icon;
  final String label;
}
