import 'package:lang_bridge/common_lib.dart';
import 'package:lang_bridge/utils/extensions.dart';
import 'package:flutter/material.dart';

class DefaultErrorWidget extends StatelessWidget {
  const DefaultErrorWidget(
    this.error,
    this.stackTrace, {
    super.key,
    this.onRetry,
  });

  final Object error;
  final StackTrace stackTrace;
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(context.l10n.defaultErrorMessage),
          ElevatedButton(
            onPressed: onRetry,
            child: Text(context.l10n.retry),
          ),
        ],
      ),
    );
  }
}
