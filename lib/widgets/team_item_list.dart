import 'package:dth/widgets/team_manager_list.dart';
import 'package:flutter/material.dart';

class TeamListItem extends StatelessWidget {
  const TeamListItem({
    required this.teamMemberData,
    super.key,
  });
  final WorkerData teamMemberData;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.remove,
            color: Colors.indigo,
          )),
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      minVerticalPadding: 0,
      leading: Text(teamMemberData.id.toString()),
      title: Text(teamMemberData.name),
    );
  }
}
