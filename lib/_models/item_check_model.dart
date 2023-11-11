class ItemCheck {
  final String id;
  final String vendoCode;
  final String batchCode;
  final String venue;
  final String quantityChecked;
  final String teamName;
  final String status;

  ItemCheck(
      {required this.id,
      required this.vendoCode,
      required this.batchCode,
      required this.venue,
      required this.quantityChecked,
      required this.teamName,
      required this.status});
}
