import 'package:dth/theme/layout.dart';
import 'package:dth/_common_widgets/spacer.dart';
import 'package:dth/_common_widgets/team_item_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
      margin: EdgeInsets.symmetric(horizontal: 10.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(globalBorderRadius + 1),
          color: Colors.white.withOpacity(1),
          border: Border.all(color: Colors.black.withOpacity(0.75))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: EdgeInsets.zero,
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(globalBorderRadius),
                topLeft: Radius.circular(globalBorderRadius),
              ),
              color: Colors.indigo,
            ),
            child: Row(
              // Heading Area
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Team',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                (widget.editable)
                    ? TextButton.icon(
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.white,
                        ),
                        onPressed: () {},
                        icon: const Icon(Icons.add),
                        label: const Text(
                          'ADD',
                          style: TextStyle(fontSize: 13),
                        ),
                      )
                    : hSpace(30),
              ],
            ),
          ),
          // Team List Area

          if (widget.teamList.isNotEmpty)
            ListView.builder(
              padding: const EdgeInsets.only(bottom: 15),
              shrinkWrap: true,
              itemExtent: 50.h,
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
