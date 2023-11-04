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
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white.withOpacity(0.5),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
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
                    : const SizedBox(
                        height: 50,
                      ),
              ],
            ),
          ),
          // Team List Area

          (widget.teamList.isNotEmpty)
              ? ListView.builder(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  shrinkWrap: true,
                  itemExtent: 50,
                  physics: const BouncingScrollPhysics(),
                  itemCount: widget.teamList.length,
                  itemBuilder: (context, index) {
                    return TeamListItem(teamMemberData: widget.teamList[index]);
                  },
                )
              : const Center(
                  child: Text('No Workers Added'),
                ),
        ],
      ),
    );
  }
}
