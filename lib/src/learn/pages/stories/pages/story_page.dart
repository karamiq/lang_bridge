import 'package:flutter/material.dart';
import 'package:lang_bridge/common_lib.dart';
import 'package:lang_bridge/data/models/story_model.dart';
import 'package:lang_bridge/src/learn/pages/stories/pages/components/bilingual_story_content.dart';
import 'package:lang_bridge/src/learn/pages/stories/pages/components/story_content_processor.dart';
import 'package:lang_bridge/src/learn/pages/stories/pages/components/story_header.dart';
import 'package:lang_bridge/src/learn/pages/stories/pages/components/story_navigation_control.dart';
import 'package:lang_bridge/src/learn/pages/stories/pages/components/story_progress_tracker.dart';
import 'components/models.dart';

class StoryPage extends StatefulWidget {
  final StoryModel story;

  const StoryPage({
    super.key,
    required this.story,
  });

  @override
  State<StoryPage> createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  late PageController _pageController;
  late StoryContentProcessor _contentProcessor;
  late StoryProgressTracker _progressTracker;
  late List<StoryPart> _storyParts;

  @override
  void initState() {
    super.initState();
    _initializeStoryComponents();
  }

  void _initializeStoryComponents() {
    _pageController = PageController();
    _contentProcessor = StoryContentProcessor(config: StoryConfig());

    // Process story content into aligned parts
    _storyParts = _contentProcessor.createAlignedParts(
      widget.story.contentEn,
      widget.story.contentAr,
    );

    // Initialize progress tracker
    _progressTracker = StoryProgressTracker(_storyParts.length);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int index) {
    setState(() {
      _progressTracker.setCurrentPart(index);
    });
  }

  void _goToNextPart() {
    if (_progressTracker.canGoNext()) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _goToPreviousPart() {
    if (_progressTracker.canGoPrevious()) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _onStoryComplete() {
    context.pop();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      body: Column(
        children: [
          StoryHeader(
            story: widget.story,
            progressTracker: _progressTracker,
          ),
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: _onPageChanged,
              itemCount: _storyParts.length,
              itemBuilder: (context, index) {
                return BilingualStoryContent(
                  storyPart: _storyParts[index],
                  isFirstPart: index == 0,
                );
              },
            ),
          ),
          StoryNavigationControls(
            progressTracker: _progressTracker,
            onPrevious: _goToPreviousPart,
            onNext: _goToNextPart,
            onComplete: _onStoryComplete,
          ),
        ],
      ),
    );
  }
}
