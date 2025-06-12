import 'package:flutter/material.dart';
import 'package:lang_bridge/data/models/authentication_model.dart';
import 'package:lang_bridge/src/leaderboard/components/podium_place.dart';

class Podium extends StatelessWidget {
  const Podium({
    super.key,
    required this.context,
    required this.users,
  });

  final BuildContext context;
  final List<AuthenticationModel> users;

  @override
  Widget build(BuildContext context) {
    if (users.length < 3) {
      return const SizedBox(
        height: 200,
        child: Center(child: Text('Not enough users for podium')),
      );
    }

    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          PodiumPlace(context: context, position: 2, user: users[1], height: 140),
          PodiumPlace(context: context, position: 1, user: users[0], height: 180),
          PodiumPlace(context: context, position: 3, user: users[2], height: 120),
        ],
      ),
    );
  }
}
