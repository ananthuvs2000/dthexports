import 'package:dth/widgets/spacer.dart';
import 'package:dth/widgets/team_item_list.dart';
import 'package:flutter/material.dart';

class TeamManagerWidget extends StatefulWidget {
  const TeamManagerWidget({
    required this.editable,
    required this.teamList,
    super.key,
  });

  final bool editable;
  final List<WorkerData> teamList;
  @override
  State<TeamManagerWidget> createState() => _TeamManagerWidgetState();
}

class WorkerData {
  final int id;
  final String name;

  WorkerData({required this.id, required this.name});
}

class _TeamManagerWidgetState extends State<TeamManagerWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.zero,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white.withOpacity(1),
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            color: Colors.black.withOpacity(0.25),
          )
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: EdgeInsets.zero,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(10),
                topLeft: Radius.circular(10),
              ),
              color: Colors.indigo,
            ),
            child: Row(
              // Heading Area
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'TEAM',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
                (widget.editable)
                    ? TextButton.icon(
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.white,
                        ),
                        onPressed: () {},
                        icon: const Icon(Icons.add),
                        label: const Text('ADD'),
                      )
                    : hSpace(40),
              ],
            ),
          ),
          // Team List Area

          if (widget.teamList.isNotEmpty)
            ListView.builder(
              padding: const EdgeInsets.only(
                top: 0,
                bottom: 10,
              ),
              shrinkWrap: true,
              itemExtent: 50,
              physics: const BouncingScrollPhysics(),
              itemCount: widget.teamList.length,
              itemBuilder: (context, index) {
                return TeamListItem(teamMemberData: widget.teamList[index]);
              },
            )
          else
            const Center(
              child: Text('No Workers Added'),
            ),
        ],
      ),
    );
  }
}
