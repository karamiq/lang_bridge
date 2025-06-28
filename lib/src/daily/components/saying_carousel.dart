import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lang_bridge/common_lib.dart';
import 'package:lang_bridge/data/models/saying_model.dart';
import 'package:lang_bridge/src/daily/components/saying_card.dart';
import 'package:lang_bridge/utils/widgets/carousel/dot_indicator.dart';

class SayingsCarousel extends StatefulWidget {
  final List<SayingModel> sayings;
  final Duration autoScrollDuration;

  const SayingsCarousel({
    super.key,
    required this.sayings,
    this.autoScrollDuration = const Duration(seconds: 5),
  });

  @override
  State<SayingsCarousel> createState() => _SayingsCarouselState();
}

class _SayingsCarouselState extends State<SayingsCarousel> {
  int _selectedIndex = 0;
  late PageController _pageController;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
    _startAutoScroll();
  }

  void _startAutoScroll() {
    _timer = Timer.periodic(widget.autoScrollDuration, (Timer timer) {
      if (_selectedIndex < widget.sayings.length - 1) {
        _selectedIndex++;
      } else {
        _selectedIndex = 0;
      }

      _pageController.animateToPage(
        _selectedIndex,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeOutCubic,
      );
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.sayings.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      children: [
        LayoutBuilder(
          builder: (context, constraints) {
            // Calculate dynamic height based on screen size
            final screenHeight = MediaQuery.of(context).size.height;
            double dynamicHeight = screenHeight * .3;
            dynamicHeight = dynamicHeight.clamp(200.0, 400.0);

            // If we have very limited space, use a smaller percentage
            if (screenHeight < 600) {
              dynamicHeight = screenHeight * 0.35;
              dynamicHeight = dynamicHeight.clamp(180.0, 250.0);
            }

            return SizedBox(
              height: dynamicHeight,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(Insets.large),
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: widget.sayings.length,
                  onPageChanged: (int index) {
                    setState(() {
                      _selectedIndex = index;
                    });
                  },
                  itemBuilder: (context, index) => SayingCard(
                    saying: widget.sayings[index],
                  ),
                ),
              ),
            );
          },
        ),
        const Gap(Insets.small),
        FittedBox(
          child: Padding(
            padding: const EdgeInsets.all(Insets.extraSmall),
            child: SizedBox(
              height: 16,
              child: Row(
                children: List.generate(
                  widget.sayings.length,
                  (index) {
                    return Padding(
                      padding: const EdgeInsets.only(left: Insets.small),
                      child: DotIndicator(
                        isActive: index == _selectedIndex,
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
