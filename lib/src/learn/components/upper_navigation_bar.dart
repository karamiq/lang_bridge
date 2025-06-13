import 'package:flutter/material.dart';
import 'package:lang_bridge/common_lib.dart';
import 'package:lang_bridge/src/learn/components/upper_navigation_button.dart';

class UpperNavigationBar extends StatefulWidget {
  const UpperNavigationBar({
    required this.tabs,
    required this.selectedIndex,
    required this.onTabChanged,
    super.key,
  });

  final List<UpperNavigationBarButton> tabs;
  final int selectedIndex;
  final ValueChanged<int> onTabChanged;

  @override
  State<UpperNavigationBar> createState() => _UpperNavigationBarState();
}

class _UpperNavigationBarState extends State<UpperNavigationBar> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: Duration(milliseconds: 300),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(
      begin: 0.95,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.elasticOut,
    ));

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _scaleAnimation,
      builder: (context, child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: Container(
            margin: EdgeInsets.all(16),
            padding: EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: context.colorScheme.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: context.colorScheme.shadow.withOpacity(0.1),
                  blurRadius: 7,
                  spreadRadius: 5,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              children: [
                for (int i = 0; i < widget.tabs.length; i++)
                  Expanded(
                    child: _buildTabButton(widget.tabs[i], i),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildTabButton(UpperNavigationBarButton tab, int index) {
    final colorScheme = Theme.of(context).colorScheme;
    bool isSelected = widget.selectedIndex == index;

    return Material(
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () => widget.onTabChanged(index),
        child: AnimatedContainer(
          padding: Insets.smallAll,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInOutCubic,
          margin: EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            gradient: isSelected
                ? LinearGradient(
                    colors: [
                      colorScheme.primary,
                      colorScheme.primary.withOpacity(0.8),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  )
                : null,
            borderRadius: BorderRadius.circular(16),
            boxShadow: isSelected
                ? [
                    BoxShadow(
                      color: colorScheme.primary.withOpacity(0.3),
                      blurRadius: 8,
                      offset: Offset(0, 2),
                    ),
                  ]
                : null,
          ),
          child: Material(
            color: Colors.transparent,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AnimatedContainer(
                    transformAlignment: Alignment.center,
                    duration: Duration(milliseconds: 300),
                    transform: Matrix4.identity()..scale(isSelected ? 1.2 : 1.0),
                    child: Container(
                      padding: Insets.smallAll,
                      decoration: isSelected
                          ? BoxDecoration(
                              color: context.colorScheme.onPrimary.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(12),
                            )
                          : null,
                      child: SvgPicture.asset(
                        tab.icon,
                        width: isSelected ? 24 : 22,
                        height: isSelected ? 24 : 22,
                        fit: BoxFit.contain,
                        colorFilter: ColorFilter.mode(
                          isSelected
                              ? context.colorScheme.onPrimary
                              : context.colorScheme.onPrimary.withOpacity(0.7),
                          BlendMode.srcIn,
                        ),
                      ),
                    )),
                SizedBox(height: Insets.small),
                AnimatedDefaultTextStyle(
                  duration: Duration(milliseconds: 300),
                  style: TextStyle(
                    color: isSelected ? colorScheme.onPrimary : colorScheme.onSurface.withOpacity(0.6),
                    fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                    fontSize: isSelected ? 13 : 12,
                  ),
                  child: Text(tab.label),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
