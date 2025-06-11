import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.title,
    required this.arabic,
    required this.gradientColors,
    required this.icon,
    this.onPressed,
  });

  final String title;
  final String arabic;
  final List<Color> gradientColors;
  final IconData icon;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: gradientColors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: gradientColors[0].withOpacity(0.3),
            blurRadius: 15,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: onPressed,
          child: Padding(
            padding: EdgeInsets.all(24),
            child: Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Icon(
                    icon,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        arabic,
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.9),
                          fontSize: 16,
                        ),
                        textDirection: TextDirection.rtl,
                      ),
                      SizedBox(height: 12),
                      // Container(
                      //   padding: EdgeInsets.symmetric(
                      //     horizontal: 12,
                      //     vertical: 6,
                      //   ),
                      //   decoration: BoxDecoration(
                      //     color: Colors.white.withOpacity(0.2),
                      //     borderRadius: BorderRadius.circular(20),
                      //   ),
                      //   child: Text(
                      //     '$wordCount words',
                      //     style: TextStyle(
                      //       color: Colors.white,
                      //       fontSize: 12,
                      //       fontWeight: FontWeight.w600,
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Colors.white,
                  size: 18,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
