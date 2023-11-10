import 'package:dth/theme/layout.dart';
import 'package:flutter/material.dart';

class CheckingWorkList extends StatelessWidget {
  const CheckingWorkList({
    this.data,
    super.key,
  });

  final List? data;

  @override
  Widget build(BuildContext context) {
    return (data != null)
        ? Container(
            child: (data!.isNotEmpty)
                ? ListView.builder(
                    itemCount: data!.length,
                    itemBuilder: (context, index) {
                      return const SizedBox();
                    },
                  )
                : const Center(child: Text('No checking work added yet')),
          )
        : const Center(
            child: Text('No data'),
          );
  }
}

class CheckingWorkItem extends StatelessWidget {
  const CheckingWorkItem({
    super.key,
    required this.venue,
    required this.vendorCode,
    required this.quantityChecked,
    required this.team,
  });

  final String venue;
  final String vendorCode;
  final String quantityChecked;
  final String team;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(globalBorderRadius),
        color: Colors.transparent,
        border: Border.all(
          color: Colors.black.withOpacity(0.75),
        ),
      ),
      child: GridView.count(
        shrinkWrap: true,
        crossAxisCount: 2,
      ),
    );
  }
}
