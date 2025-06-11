import 'package:flutter/material.dart';

class AchievementsPage extends StatefulWidget {
  const AchievementsPage({super.key});

  @override
  State<AchievementsPage> createState() => _AchievementsPageState();
}

class _AchievementsPageState extends State<AchievementsPage> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        title: const Text(
          'Achievements',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: colorScheme.surface,
        elevation: 0,
        bottom: TabBar(
          controller: _tabController,
          labelColor: colorScheme.primary,
          unselectedLabelColor: colorScheme.onSurface.withOpacity(0.6),
          indicatorColor: colorScheme.primary,
          tabs: const [
            Tab(text: 'Learning'),
            Tab(text: 'Streaks'),
            Tab(text: 'Social'),
            Tab(text: 'Special'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildLearningAchievements(colorScheme),
          _buildStreakAchievements(colorScheme),
          _buildSocialAchievements(colorScheme),
          _buildSpecialAchievements(colorScheme),
        ],
      ),
    );
  }

  Widget _buildLearningAchievements(ColorScheme colorScheme) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionHeader('Progress Milestones', colorScheme),
          const SizedBox(height: 16),
          _buildAchievementCard(
            icon: Icons.military_tech,
            title: 'First Steps',
            description: 'Complete your first lesson',
            progress: 1.0,
            isUnlocked: true,
            colorScheme: colorScheme,
          ),
          _buildAchievementCard(
            icon: Icons.school,
            title: 'Student',
            description: 'Complete 10 lessons',
            progress: 0.8,
            isUnlocked: false,
            currentValue: 8,
            targetValue: 10,
            colorScheme: colorScheme,
          ),
          _buildAchievementCard(
            icon: Icons.auto_awesome,
            title: 'Scholar',
            description: 'Complete 50 lessons',
            progress: 0.3,
            isUnlocked: false,
            currentValue: 15,
            targetValue: 50,
            colorScheme: colorScheme,
          ),
          _buildAchievementCard(
            icon: Icons.psychology,
            title: 'Polyglot',
            description: 'Complete 100 lessons',
            progress: 0.15,
            isUnlocked: false,
            currentValue: 15,
            targetValue: 100,
            colorScheme: colorScheme,
          ),
          const SizedBox(height: 24),
          _buildSectionHeader('Vocabulary Master', colorScheme),
          const SizedBox(height: 16),
          _buildAchievementCard(
            icon: Icons.book,
            title: 'Word Collector',
            description: 'Learn 100 new words',
            progress: 0.75,
            isUnlocked: false,
            currentValue: 75,
            targetValue: 100,
            colorScheme: colorScheme,
          ),
          _buildAchievementCard(
            icon: Icons.library_books,
            title: 'Vocabulary Expert',
            description: 'Learn 500 new words',
            progress: 0.15,
            isUnlocked: false,
            currentValue: 75,
            targetValue: 500,
            colorScheme: colorScheme,
          ),
        ],
      ),
    );
  }

  Widget _buildStreakAchievements(ColorScheme colorScheme) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionHeader('Daily Commitment', colorScheme),
          const SizedBox(height: 16),
          _buildAchievementCard(
            icon: Icons.local_fire_department,
            title: 'Getting Started',
            description: 'Maintain a 3-day streak',
            progress: 1.0,
            isUnlocked: true,
            colorScheme: colorScheme,
          ),
          _buildAchievementCard(
            icon: Icons.whatshot,
            title: 'On Fire',
            description: 'Maintain a 7-day streak',
            progress: 1.0,
            isUnlocked: true,
            colorScheme: colorScheme,
          ),
          _buildAchievementCard(
            icon: Icons.emoji_events,
            title: 'Dedicated Learner',
            description: 'Maintain a 30-day streak',
            progress: 0.4,
            isUnlocked: false,
            currentValue: 12,
            targetValue: 30,
            colorScheme: colorScheme,
          ),
          _buildAchievementCard(
            icon: Icons.diamond,
            title: 'Unstoppable',
            description: 'Maintain a 100-day streak',
            progress: 0.12,
            isUnlocked: false,
            currentValue: 12,
            targetValue: 100,
            colorScheme: colorScheme,
          ),
        ],
      ),
    );
  }

  Widget _buildSocialAchievements(ColorScheme colorScheme) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionHeader('Community', colorScheme),
          const SizedBox(height: 16),
          _buildAchievementCard(
            icon: Icons.share,
            title: 'First Share',
            description: 'Share your first achievement',
            progress: 0.0,
            isUnlocked: false,
            colorScheme: colorScheme,
          ),
          _buildAchievementCard(
            icon: Icons.people,
            title: 'Team Player',
            description: 'Join a study group',
            progress: 0.0,
            isUnlocked: false,
            colorScheme: colorScheme,
          ),
          _buildAchievementCard(
            icon: Icons.leaderboard,
            title: 'Top Performer',
            description: 'Reach top 10 in weekly leaderboard',
            progress: 0.0,
            isUnlocked: false,
            colorScheme: colorScheme,
          ),
          _buildAchievementCard(
            icon: Icons.help_outline,
            title: 'Mentor',
            description: 'Help 5 other learners',
            progress: 0.0,
            isUnlocked: false,
            currentValue: 0,
            targetValue: 5,
            colorScheme: colorScheme,
          ),
        ],
      ),
    );
  }

  Widget _buildSpecialAchievements(ColorScheme colorScheme) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionHeader('Special Events', colorScheme),
          const SizedBox(height: 16),
          _buildAchievementCard(
            icon: Icons.celebration,
            title: 'Early Bird',
            description: 'Complete a lesson before 8 AM',
            progress: 0.0,
            isUnlocked: false,
            colorScheme: colorScheme,
          ),
          _buildAchievementCard(
            icon: Icons.nights_stay,
            title: 'Night Owl',
            description: 'Complete a lesson after 10 PM',
            progress: 1.0,
            isUnlocked: true,
            colorScheme: colorScheme,
          ),
          _buildAchievementCard(
            icon: Icons.speed,
            title: 'Speed Demon',
            description: 'Complete a lesson in under 2 minutes',
            progress: 0.0,
            isUnlocked: false,
            colorScheme: colorScheme,
          ),
          _buildAchievementCard(
            icon: Icons.circle,
            title: 'Perfectionist',
            description: 'Get 100% on 5 lessons in a row',
            progress: 0.6,
            isUnlocked: false,
            currentValue: 3,
            targetValue: 5,
            colorScheme: colorScheme,
          ),
          _buildAchievementCard(
            icon: Icons.weekend,
            title: 'Weekend Warrior',
            description: 'Study on 4 consecutive weekends',
            progress: 0.25,
            isUnlocked: false,
            currentValue: 1,
            targetValue: 4,
            colorScheme: colorScheme,
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title, ColorScheme colorScheme) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: colorScheme.onSurface,
      ),
    );
  }

  Widget _buildAchievementCard({
    required IconData icon,
    required String title,
    required String description,
    required double progress,
    required bool isUnlocked,
    int? currentValue,
    int? targetValue,
    required ColorScheme colorScheme,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainer,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isUnlocked ? colorScheme.primary.withOpacity(0.3) : colorScheme.outline.withOpacity(0.2),
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: isUnlocked ? colorScheme.primary : colorScheme.onSurface.withOpacity(0.3),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Icon(
                icon,
                color: isUnlocked ? colorScheme.onPrimary : colorScheme.onSurface.withOpacity(0.5),
                size: 30,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: isUnlocked ? colorScheme.onSurface : colorScheme.onSurface.withOpacity(0.7),
                        ),
                      ),
                      if (isUnlocked) ...[
                        const SizedBox(width: 8),
                        Icon(
                          Icons.check_circle,
                          color: colorScheme.primary,
                          size: 20,
                        ),
                      ],
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 14,
                      color: colorScheme.onSurface.withOpacity(0.6),
                    ),
                  ),
                  if (!isUnlocked) ...[
                    const SizedBox(height: 8),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: LinearProgressIndicator(
                        value: progress,
                        backgroundColor: colorScheme.outline.withOpacity(0.2),
                        valueColor: AlwaysStoppedAnimation<Color>(
                          colorScheme.primary,
                        ),
                        minHeight: 6,
                      ),
                    ),
                    if (currentValue != null && targetValue != null) ...[
                      const SizedBox(height: 4),
                      Text(
                        '$currentValue / $targetValue',
                        style: TextStyle(
                          fontSize: 12,
                          color: colorScheme.onSurface.withOpacity(0.5),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
