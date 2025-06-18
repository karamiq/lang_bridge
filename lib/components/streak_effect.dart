import 'package:flutter/material.dart';
import 'dart:math' as math;

class StreakCounter extends StatefulWidget {
  final int streakCount;
  final Color primaryColor;
  final Color secondaryColor;
  final double size;

  const StreakCounter({
    super.key,
    required this.streakCount,
    this.primaryColor = Colors.orange,
    this.secondaryColor = Colors.deepOrange,
    this.size = 100,
  });

  @override
  State<StreakCounter> createState() => _StreakCounterState();
}

class _StreakCounterState extends State<StreakCounter> with TickerProviderStateMixin {
  late AnimationController _scaleController;
  late AnimationController _fadeController;
  late AnimationController _particleController;
  late AnimationController _numberController;

  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;
  late Animation<double> _particleAnimation;
  late Animation<int> _numberAnimation;

  List<Particle> particles = [];
  int _previousCount = 0;
  bool _isAnimating = false;

  @override
  void initState() {
    super.initState();
    _previousCount = widget.streakCount;
    _setupAnimations();
  }

  void _setupAnimations() {
    _scaleController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );

    _particleController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    _numberController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 1.2,
    ).animate(CurvedAnimation(
      parent: _scaleController,
      curve: Curves.elasticOut,
    ));

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _fadeController,
      curve: const Interval(0.0, 0.6, curve: Curves.easeOut),
    ));

    _particleAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _particleController,
      curve: Curves.easeOut,
    ));

    _numberAnimation = IntTween(
      begin: _previousCount,
      end: widget.streakCount,
    ).animate(CurvedAnimation(
      parent: _numberController,
      curve: Curves.easeOut,
    ));
  }

  @override
  void didUpdateWidget(StreakCounter oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.streakCount != widget.streakCount && !_isAnimating) {
      _animateToNewValue(oldWidget.streakCount, widget.streakCount);
    }
  }

  void _animateToNewValue(int oldValue, int newValue) async {
    if (oldValue == newValue) return;

    setState(() {
      _isAnimating = true;
    });

    // Update number animation
    _numberAnimation = IntTween(
      begin: oldValue,
      end: newValue,
    ).animate(CurvedAnimation(
      parent: _numberController,
      curve: Curves.easeOut,
    ));

    // Generate particles only if value increased
    if (newValue > oldValue) {
      _generateParticles();

      // Reset and start all animations
      _scaleController.reset();
      _fadeController.reset();
      _particleController.reset();

      _fadeController.forward();
      _scaleController.forward();
      _particleController.forward();
    }

    // Always animate the number
    _numberController.reset();
    await _numberController.forward();

    // Return scale to normal
    if (newValue > oldValue) {
      await _scaleController.reverse();
    }

    setState(() {
      _isAnimating = false;
      _previousCount = newValue;
    });
  }

  void _generateParticles() {
    final random = math.Random();
    particles.clear();

    for (int i = 0; i < 20; i++) {
      particles.add(Particle(
        startX: 0,
        startY: 0,
        endX: (random.nextDouble() - 0.5) * 200,
        endY: (random.nextDouble() - 0.5) * 200,
        size: random.nextDouble() * 8 + 2,
        color: Color.lerp(
          widget.primaryColor,
          widget.secondaryColor,
          random.nextDouble(),
        )!,
        delay: random.nextDouble() * 0.3,
      ));
    }
  }

  @override
  void dispose() {
    _scaleController.dispose();
    _fadeController.dispose();
    _particleController.dispose();
    _numberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.size * 2.5,
      width: widget.size * 2.5,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Background circle
          Container(
            width: widget.size * 1.8,
            height: widget.size * 1.8,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: widget.primaryColor.withOpacity(0.3),
                width: 2,
              ),
            ),
          ),

          // Animated particles (only show when animating and value increased)
          if (_isAnimating && widget.streakCount > _previousCount)
            AnimatedBuilder(
              animation: _particleAnimation,
              builder: (context, child) {
                return Stack(
                  alignment: Alignment.center,
                  children: particles.map((particle) => _buildParticle(particle)).toList(),
                );
              },
            ),

          // Glow effect (only show when animating and value increased)
          if (_isAnimating && widget.streakCount > _previousCount)
            AnimatedBuilder(
              animation: _fadeAnimation,
              builder: (context, child) {
                return Transform.scale(
                  scale: _scaleAnimation.value * 0.9,
                  child: Opacity(
                    opacity: _fadeAnimation.value * 0.4,
                    child: Container(
                      width: widget.size * 1.6,
                      height: widget.size * 1.6,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: RadialGradient(
                          colors: [
                            widget.primaryColor.withOpacity(0.6),
                            Colors.transparent,
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),

          // Main streak display
          AnimatedBuilder(
            animation: Listenable.merge([_scaleAnimation, _numberAnimation]),
            builder: (context, child) {
              return Transform.scale(
                scale: _scaleAnimation.value,
                child: Container(
                  width: widget.size,
                  height: widget.size,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        widget.primaryColor,
                        widget.secondaryColor,
                      ],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: widget.primaryColor.withOpacity(_isAnimating ? 0.6 : 0.3),
                        blurRadius: _isAnimating ? 25 : 15,
                        spreadRadius: _isAnimating ? 8 : 5,
                      ),
                    ],
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.local_fire_department,
                          color: Colors.white,
                          size: widget.size * 0.32,
                        ),
                        Text(
                          '${_numberAnimation.value}',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: widget.size * 0.2,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),

          // Difference indicator (only show when value increased)
          if (_isAnimating && widget.streakCount > _previousCount)
            AnimatedBuilder(
              animation: _particleAnimation,
              builder: (context, child) {
                final difference = widget.streakCount - (_numberAnimation.value);
                if (difference <= 0) return const SizedBox.shrink();

                return Transform.translate(
                  offset: Offset(0, -widget.size * 0.8 * _particleAnimation.value),
                  child: Opacity(
                    opacity: (1 - _particleAnimation.value).clamp(0.0, 1.0),
                    child: Text(
                      '+$difference',
                      style: TextStyle(
                        color: widget.primaryColor,
                        fontSize: widget.size * 0.32,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(
                            color: widget.primaryColor.withOpacity(0.5),
                            blurRadius: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
        ],
      ),
    );
  }

  Widget _buildParticle(Particle particle) {
    final progress = (_particleAnimation.value - particle.delay).clamp(0.0, 1.0);

    if (progress <= 0) return const SizedBox.shrink();

    final x = particle.startX + (particle.endX - particle.startX) * progress;
    final y = particle.startY + (particle.endY - particle.startY) * progress;

    return Transform.translate(
      offset: Offset(x, y),
      child: Opacity(
        opacity: (1 - progress).clamp(0.0, 1.0),
        child: Container(
          width: particle.size,
          height: particle.size,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: particle.color,
            boxShadow: [
              BoxShadow(
                color: particle.color.withOpacity(0.7),
                blurRadius: 6,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Particle {
  final double startX;
  final double startY;
  final double endX;
  final double endY;
  final double size;
  final Color color;
  final double delay;

  Particle({
    required this.startX,
    required this.startY,
    required this.endX,
    required this.endY,
    required this.size,
    required this.color,
    required this.delay,
  });
}

// Example usage:
class StreakDemo extends StatefulWidget {
  const StreakDemo({super.key});

  @override
  State<StreakDemo> createState() => _StreakDemoState();
}

class _StreakDemoState extends State<StreakDemo> {
  int streakCount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: const Text('Simplified Streak Effect'),
        backgroundColor: Colors.grey[800],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StreakCounter(
              streakCount: streakCount,
              primaryColor: Colors.orange,
              secondaryColor: Colors.deepOrange,
              size: 120,
            ),
            const SizedBox(height: 40),
            Text(
              'Streak: $streakCount days',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => setState(() => streakCount++),
                  child: const Text('+1'),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () => setState(() => streakCount += 5),
                  child: const Text('+5'),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () => setState(() => streakCount = 0),
                  child: const Text('Reset'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
