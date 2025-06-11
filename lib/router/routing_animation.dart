import 'package:flutter/material.dart';

import '../common_lib.dart';

CustomTransitionPage<void> instanTransition(GoRouterState state, Widget page,
    {Duration duration = const Duration(milliseconds: 0)}) {
  return CustomTransitionPage<void>(
    key: state.pageKey,
    restorationId: state.pageKey.value,
    child: page,
    transitionDuration: duration,
    transitionsBuilder: (
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child,
    ) =>
        FadeTransition(
      opacity: animation,
      child: page,
    ),
  );
}
