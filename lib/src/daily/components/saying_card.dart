import 'package:flutter/material.dart';
import 'package:lang_bridge/data/models/saying_model.dart';

import '../../../common_lib.dart';

class SayingCard extends StatelessWidget {
  final SayingModel saying;

  const SayingCard({
    super.key,
    required this.saying,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Theme.of(context).primaryColor.withOpacity(0.8),
            Theme.of(context).primaryColor.withOpacity(0.6),
          ],
        ),
        borderRadius: BorderRadius.circular(Insets.large),
      ),
      child: Padding(
        padding: const EdgeInsets.all(Insets.large),
        child: Column(
          children: [
            Icon(
              Icons.format_quote,
              size: 32,
              color: Colors.white.withOpacity(0.8),
            ),
            const Gap(Insets.small),
            Expanded(
              child: SingleChildScrollView(
                child: Center(
                  child: Text(
                    saying.arabicSaying,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        fontFamily: 'thuluth'),
                    textAlign: TextAlign.center,
                    maxLines: null, // Allow unlimited lines
                    overflow: TextOverflow.visible,
                  ),
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Center(
                  child: Text(
                    saying.englishSaying,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Colors.white.withOpacity(0.9),
                          fontStyle: FontStyle.italic,
                          height: 1.3,
                        ),
                    textAlign: TextAlign.center,
                    maxLines: null, // Allow unlimited lines
                    overflow: TextOverflow.visible,
                  ),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '— ${saying.arabicAuthor}',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.white.withOpacity(0.9),
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      fontFamily: 'thuluth'),
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                if (saying.englishAuthor.isNotEmpty) ...[
                  const Gap(Insets.extraSmall),
                  Text(
                    '— ${saying.englishAuthor}',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Colors.white.withOpacity(0.9),
                        ),
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }
}
