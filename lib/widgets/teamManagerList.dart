import 'package:flutter/material.dart';

class TeamManagerWidget extends StatefulWidget {
  const TeamManagerWidget({
    super.key,
  });

  @override
  State<TeamManagerWidget> createState() => _TeamManagerWidgetState();
}

class _TeamManagerWidgetState extends State<TeamManagerWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        // Heading Area
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [],
          ),
        ],
      ),
    );
  }
}

class TeamListItem extends StatelessWidget {
  const TeamListItem({
    required this.teamMemberData,
    super.key,
  });
  final List<Map<String, String>> teamMemberData;
  @override
  Widget build(BuildContext context) {
    return const ListTile();
  }
}
