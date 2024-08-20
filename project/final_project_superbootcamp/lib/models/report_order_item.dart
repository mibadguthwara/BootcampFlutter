class ReportOrderItem {
  String id;
  DateTime createdAt;
  dynamic pdfData;

  ReportOrderItem({
    required this.id,
    required this.createdAt,
    required this.pdfData,
  });
}
